//
//  BSAppDelegate.h
//  moduleDemo
//
//  Created by 隋帮林 on 2019/4/18.
//  Copyright © 2019 Kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>
#else
#import <APPKit/APPKit.h>
#endif


@protocol BSAppDelegate <NSObject>

NS_ASSUME_NONNULL_BEGIN

@optional
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
- (BOOL)applicationDidFinishLaunchingWithOptions:(UIApplication *)application;
- (void)applicationWillEnterForeground:(UIApplication *)application;
- (void)applicationDidBecomeActive:(UIApplication *)application;
- (void)applicationWillResignActive:(UIApplication *)application;
- (void)applicationDidEnterBackground:(UIApplication *)application;
- (void)applicationWillTerminate:(UIApplication *)application;
#else
- (BOOL)applicationDidFinishLaunchingWithOptions:(NSApplication *)application;
- (void)applicationWillEnterForeground:(NSApplication *)application;
- (void)applicationDidBecomeActive:(NSApplication *)application;
- (void)applicationWillResignActive:(NSApplication *)application;
- (void)applicationDidEnterBackground:(NSApplication *)application;
- (void)applicationWillTerminate:(NSApplication *)application;
#endif

NS_ASSUME_NONNULL_END

@end

