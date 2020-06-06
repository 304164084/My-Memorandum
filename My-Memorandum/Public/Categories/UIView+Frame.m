//
//  UIView+Frame.m
//  FreePlay
//
//  Created by Banglin on 2019/4/28.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)


+ (CGFloat)heightOfStatusBar
{
    CGFloat height = [UIApplication sharedApplication].statusBarFrame.size.height;
    return height;
}

+ (CGFloat)heightOfNavigationBar
{
    // 暂时先这么写, 后续发生变化再重新考量
    return 44.f;
}

- (void)setBs_x:(CGFloat)bs_x
{
    CGRect frame = self.frame;
    frame.origin.x = bs_x;
    self.frame = frame;
}

- (CGFloat)bs_x
{
    return self.frame.origin.x;
}

- (void)setBs_y:(CGFloat)bs_y
{
    CGRect frame = self.frame;
    frame.origin.y = bs_y;
    self.frame = frame;
}

- (CGFloat)bs_y
{
    return self.frame.origin.y;
}

- (void)setBs_width:(CGFloat)bs_width
{
    CGRect frame = self.frame;
    frame.size.width = bs_width;
    self.frame = frame;
}

- (CGFloat)bs_width
{
    return self.frame.size.width;
}

- (void)setBs_height:(CGFloat)bs_height
{
    CGRect frame = self.frame;
    frame.size.height = bs_height;
    self.frame = frame;
}

- (CGFloat)bs_height
{
    return self.frame.size.height;
}

- (void)setBs_centerX:(CGFloat)bs_centerX
{
    CGPoint center = self.center;
    center.x = bs_centerX;
    self.center = center;
}

- (CGFloat)bs_centerX
{
    return self.center.x;
}

- (void)setBs_centerY:(CGFloat)bs_centerY
{
    CGPoint center = self.center;
    center.y = bs_centerY;
    self.center = center;
}

- (CGFloat)bs_centerY
{
    return self.center.y;
}


#pragma mark - 安全区域
+ (CGFloat)bs_leadingSpaceOfSafeAreaInsets
{
    CGFloat left = 0.f;
    if (@available(iOS 11.0, *)) {
        left = [UIApplication sharedApplication].keyWindow.safeAreaInsets.left;
    }
    
    return left;
}

+ (CGFloat)bs_trailingSpaceOfSareAreaInsets
{
    CGFloat right = 0.f;
    if (@available(iOS 11.0, *)) {
        right = [UIApplication sharedApplication].keyWindow.safeAreaInsets.right;
    }
    return right;
}

+ (CGFloat)bs_topSpaceOfSafeAreaInsets
{
    CGFloat top = 0.f;
    if (@available(iOS 11.0, *)) {
        top = [UIApplication sharedApplication].keyWindow.safeAreaInsets.top;
    }
    return top;
}

+ (CGFloat)bs_bottomSpaceOfSafeAreaInsets
{
    CGFloat bottom = 0.f;
    if (@available(iOS 11.0, *)) {
        bottom = [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
    }
    return bottom;
}

@end
