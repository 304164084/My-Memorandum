//
//  BSBaseNavigationController.m
//  FreePlay
//
//  Created by Banglin on 2019/4/25.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import "BSBaseNavigationController.h"
#import <objc/runtime.h>

@interface BSBaseNavigationController ()
<
UINavigationControllerDelegate
>

@end

@implementation BSBaseNavigationController

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class selfCls = [self class];
        Method original = class_getInstanceMethod(selfCls, @selector(pushViewController:animated:));
        Method swizzle = class_getInstanceMethod(selfCls, @selector(bs_pushViewController:animated:));
        
        BOOL result = class_addMethod(selfCls, method_getName(original), method_getImplementation(swizzle), method_getTypeEncoding(swizzle));
        if (result) {
            class_replaceMethod(selfCls, method_getName(swizzle), method_getImplementation(original), method_getTypeEncoding(original));
        } else {
            method_exchangeImplementations(original, swizzle);
        }
    });
}

- (void)bs_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 非topViewController 隐藏底部工具栏.
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    } else {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [self bs_pushViewController:viewController animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDefaultConfigration];
}

- (void)setupDefaultConfigration
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
}

#pragma mark - delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}

@end
