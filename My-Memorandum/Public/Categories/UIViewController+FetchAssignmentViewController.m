//
//  UIViewController+FetchAssignmentViewController.m
//  moduleDemo
//
//  Created by 隋帮林 on 2019/4/22.
//  Copyright © 2019 Kingsoft. All rights reserved.
//

#import "UIViewController+FetchAssignmentViewController.h"

@implementation UIViewController (FetchAssignmentViewController)

// 获取当前导航控制器
+ (BSBaseNavigationController *)bs_currentNavigationController
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *vc = keyWindow.rootViewController;
    
    // modal
    if (!vc.presentedViewController && [vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tbc = (UITabBarController *)vc;
        return tbc.selectedViewController;
    }
    
    return nil;
}

- (BSBaseNavigationController * _Nullable)bs_currentNavigationController
{
    if ([self isKindOfClass:[BSBaseNavigationController class]]) {
        return (BSBaseNavigationController *)self;
    }
    
    if ([self isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tbc = (UITabBarController *)self;
        return tbc.selectedViewController;
    }
    
    if ([self isKindOfClass:[UIViewController class]]) {
        UIViewController *next = self.presentedViewController;
        if (next) {
            return (BSBaseNavigationController *)next.navigationController;
        }
        
        
        return nil;
    }
    
    return nil;
}


@end
