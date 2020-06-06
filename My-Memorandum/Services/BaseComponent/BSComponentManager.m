//
//  BSComponentManager.m
//  moduleDemo
//
//  Created by 隋帮林 on 2019/4/18.
//  Copyright © 2019 Kingsoft. All rights reserved.
//

#import "BSComponentManager.h"
#import "MGJRouter.h"

static NSString *const BSComponentDefaultPlistName = @"Components";

@interface BSComponentManager ()

@property (nonatomic, strong) NSArray<BSBaseComponent *> *components;

@property (nonatomic, assign) BOOL didFinishRegister;

@end

@implementation BSComponentManager

+ (instancetype)sharedManager
{
    static BSComponentManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BSComponentManager alloc] init];
    });
    return manager;
}

+ (void)registerComponentsFromDefaultPlist
{
    [self registerComponentsFromCustomizedPlist:BSComponentDefaultPlistName];
}

+ (void)registerComponents:(NSArray<BSBaseComponent *> *)components
{
    [[BSComponentManager sharedManager] registerComponents:components];
}

+ (void)registerComponentsFromCustomizedPlist:(NSString *)plistName
{
    NSParameterAssert(plistName);
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSAssert(plistPath, @"components.plist not found");
    NSArray *componentNameArray = [NSArray arrayWithContentsOfFile:plistPath];
    NSMutableArray <BSBaseComponent *> *components = [NSMutableArray array];
    [componentNameArray enumerateObjectsUsingBlock:^(NSString  * className, NSUInteger idx, BOOL * _Nonnull stop) {
        Class componentClass = NSClassFromString(className);
        BSBaseComponent * component = [componentClass component];
        if ([component isKindOfClass:[BSBaseComponent class]]) {
            [components addObject:component];
        }
    }];
    
    [self registerComponents:components];
}

+ (NSArray<BSBaseComponent *> *)components
{
    return [[BSComponentManager sharedManager].components copy];
}

#pragma mark - instance methods
- (void)registerComponents:(NSArray<BSBaseComponent *> *)components
{
    NSAssert([NSThread currentThread].isMainThread, @"必须在主线程执行");
    if (self.didFinishRegister) {
        return;
    }
    NSMutableArray *validComponents = [NSMutableArray array];
    
    [components enumerateObjectsUsingBlock:^(BSBaseComponent * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[BSBaseComponent class]]) {
            if ([obj respondsToSelector:@selector(registeredURLs)]) {
                NSArray *urls = obj.registeredURLs;
                [urls enumerateObjectsUsingBlock:^(NSString * _Nonnull url, NSUInteger idx, BOOL * _Nonnull stop) {
                    [MGJRouter registerURLPattern:url toHandler:^(NSDictionary *routerParameters) {
                        if ([obj respondsToSelector:@selector(handleURL:userInfo:completion:)]) {
                            //将 routerParameters 中的 completion、UserInfo 剥离，方便使用
                            id completionBlock = routerParameters[MGJRouterParameterCompletion];
                            NSDictionary *userInfo = routerParameters[MGJRouterParameterUserInfo];
                            NSString *fullURL = routerParameters[MGJRouterParameterURL];
                            
                            [obj handleURL:fullURL
                                  userInfo:userInfo
                                completion:completionBlock];
                        }
                    }];
                }];
            }
            [validComponents addObject:obj];
            
        }
    }];
    
    self.components = [validComponents copy];
//    [self registerNotifications];
    self.didFinishRegister = YES;
}

- (void)registerNotifications
{
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
    [@[UIApplicationDidFinishLaunchingNotification, UIApplicationWillEnterForegroundNotification, UIApplicationDidBecomeActiveNotification, UIApplicationWillResignActiveNotification, UIApplicationDidEnterBackgroundNotification, UIApplicationWillTerminateNotification] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handelNotifications:) name:obj object:nil];
    }];
#else
    [@[NSApplicationDidFinishLaunchingNotification, NSApplicationWillBecomeActiveNotification, NSApplicationDidBecomeActiveNotification, NSApplicationWillResignActiveNotification, NSApplicationDidFinishLaunchingNotification, NSApplicationWillTerminateNotification] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handelNotifications:) name:obj object:nil];
    }];
#endif
}

- (void)handelNotifications:(NSNotification *)notification
{
    SEL selector = nil;
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
    if ([notification.name isEqualToString:UIApplicationDidFinishLaunchingNotification]) {
        selector = @selector(applicationDidFinishLaunchingWithOptions:);
    }
    else if ([notification.name isEqualToString:UIApplicationWillEnterForegroundNotification]) {
        selector = @selector(applicationWillEnterForeground:);
    }
    else if ([notification.name isEqualToString:UIApplicationDidBecomeActiveNotification]) {
        selector = @selector(applicationDidBecomeActive:);
    }
    else if ([notification.name isEqualToString:UIApplicationWillResignActiveNotification]) {
        selector = @selector(applicationWillResignActive:);
    }
    else if ([notification.name isEqualToString:UIApplicationDidEnterBackgroundNotification]) {
        selector = @selector(applicationDidEnterBackground:);
    }
    else if ([notification.name isEqualToString:UIApplicationWillTerminateNotification]) {
        selector = @selector(applicationWillTerminate:);
    }
#else
    if ([notification.name isEqualToString:NSApplicationDidFinishLaunchingNotification]) {
        selector = @selector(applicationDidFinishLaunchingWithOptions:);
    }
    else if ([notification.name isEqualToString:NSApplicationWillBecomeActiveNotification]) {
        selector = @selector(applicationWillEnterForeground:);
    }
    else if ([notification.name isEqualToString:NSApplicationDidBecomeActiveNotification]) {
        selector = @selector(applicationDidBecomeActive:);
    }
    else if ([notification.name isEqualToString:NSApplicationWillResignActiveNotification]) {
        selector = @selector(applicationWillResignActive:);
    }
    else if ([notification.name isEqualToString:NSApplicationDidFinishLaunchingNotification]) {
        selector = @selector(applicationDidEnterBackground:);
    }
    else if ([notification.name isEqualToString:NSApplicationWillTerminateNotification]) {
        selector = @selector(applicationWillTerminate:);
    }
#endif
    
    if (selector) {
        [self.components enumerateObjectsUsingBlock:^(BSBaseComponent * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaBS"
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
                [obj performSelector:selector withObject:[UIApplication sharedApplication]];
#else
                [obj performSelector:selector withObject:[NSApplication sharedApplication]];
#endif
#pragma clang diagnostic pop
            }
        }];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
