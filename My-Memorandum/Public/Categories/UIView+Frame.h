//
//  UIView+Frame.h
//  FreePlay
//
//  Created by Banglin on 2019/4/28.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

/**
 获取状态栏高度
 
 @return 状态栏高度
 */
+ (CGFloat)heightOfStatusBar;

/**
 获取导航栏高度

 @return 导航栏高度
 */
+ (CGFloat)heightOfNavigationBar;


/**
 首部安全区域值

 @return safeInsets.left
 */
+ (CGFloat)bs_leadingSpaceOfSafeAreaInsets;
/**
 尾部安全区域值
 
 @return safeInsets.trailing
 */
+ (CGFloat)bs_trailingSpaceOfSareAreaInsets;
/**
 顶部安全区域值
 
 @return safeInsets.top
 */
+ (CGFloat)bs_topSpaceOfSafeAreaInsets;
/**
 底部安全区域值
 
 @return safeInsets.bottom
 */
+ (CGFloat)bs_bottomSpaceOfSafeAreaInsets;

/** x */
@property (nonatomic, assign) CGFloat bs_x;
/** y */
@property (nonatomic, assign) CGFloat bs_y;
/** width */
@property (nonatomic, assign) CGFloat bs_width;
/** height */
@property (nonatomic, assign) CGFloat bs_height;
/** center x */
@property (nonatomic, assign) CGFloat bs_centerX;
/** center y */
@property (nonatomic, assign) CGFloat bs_centerY;

@end

NS_ASSUME_NONNULL_END
