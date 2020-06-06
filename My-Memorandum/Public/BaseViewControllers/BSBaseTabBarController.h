//
//  BSBaseTabBarController.h
//  FreePlay
//
//  Created by Banglin on 2019/4/25.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSBaseTabBarController : UITabBarController

- (void)configTabBarWithTiles:(NSArray<NSString *> *)titles
                 normalImages:(NSArray<NSString *> *)normalImages
               selectedImages:(NSArray<NSString *> *)selectedImages
              viewControllers:(NSArray<UIViewController *> *)viewControllers;

@end

NS_ASSUME_NONNULL_END
