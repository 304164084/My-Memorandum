//
//  UIViewController+FetchAssignmentViewController.h
//  moduleDemo
//
//  Created by 隋帮林 on 2019/4/22.
//  Copyright © 2019 Kingsoft. All rights reserved.
//

#import "BSBaseViewController.h"
#import "BSBaseNavigationController.h"
#import "BSBaseTabBarController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (FetchAssignmentViewController)

/**
 * 通过'key window' 获取当前导航控制器
 **/
+ (BSBaseNavigationController *)bs_currentNavigationController;

/**
 若'self' 是'UIViewController'或其子类, 建议优先使用这个

 @return .
 */
- (BSBaseNavigationController * _Nullable)bs_currentNavigationController;

@end

NS_ASSUME_NONNULL_END
