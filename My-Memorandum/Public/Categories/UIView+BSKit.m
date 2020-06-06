//
//  UIView+BSKit.m
//  FreePlay
//
//  Created by 隋帮林 on 2019/5/7.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import "UIView+BSKit.h"

@implementation UIView (BSKit)

- (CALayer *)addOutsideBorderLayerWithBorderWidth:(CGFloat)borderWidth
                                               borderColor:(UIColor *)borderColor
                                              cornerRadius:(CGFloat)cornerRadius
{

    CALayer *layer = [CALayer layer];
    layer.borderWidth = borderWidth;
    layer.borderColor = borderColor.CGColor;
    
    CGFloat externSpace = 2.f;
    externSpace += 1.5f;
    
    layer.cornerRadius = cornerRadius / 2 + externSpace;
    layer.frame = CGRectMake(-externSpace, -externSpace, self.bs_width + externSpace * 2, self.bs_height + externSpace * 2);
    
    [self.layer addSublayer:layer];
    
    return layer;
}

@end
