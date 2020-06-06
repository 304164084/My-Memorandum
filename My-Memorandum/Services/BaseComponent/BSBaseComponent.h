//
//  BSBaseComponent.h
//  moduleDemo
//
//  Created by 隋帮林 on 2019/4/18.
//  Copyright © 2019 Kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
// 使用UINavigationViewController
#import "UIViewController+FetchAssignmentViewController.h"

#import "URLHelper.h"

#import "BSAppDelegate.h"
#import "BSRouterDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface BSBaseComponent : NSObject <BSAppDelegate, BSRouterDataSource>

+ (instancetype)component NS_REQUIRES_SUPER;


@end

NS_ASSUME_NONNULL_END
