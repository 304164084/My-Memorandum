//
//  BSBaseViewController.h
//  FreePlay
//
//  Created by Banglin on 2019/4/25.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGJRouter.h"

NS_ASSUME_NONNULL_BEGIN

@interface BSBaseViewController : UIViewController

/**
 初始化UI
 在基类的 '- (void)loadView' 中已调用
 */
- (void)setupViews;

- (void)setupConfigration;

@end

NS_ASSUME_NONNULL_END
