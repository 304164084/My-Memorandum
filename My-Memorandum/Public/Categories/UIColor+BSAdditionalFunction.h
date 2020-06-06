//
//  UIColor+BSAdditionalFunction.h
//  FreePlay
//
//  Created by 隋帮林 on 2019/5/5.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (BSAdditionalFunction)

/**
 *  根据十六进制字符串生成 UIColor
 *
 *  @param hexString  十六进制颜色值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 *  根据十六进制字符串生成 UIColor
 *
 *  @param hexString  十六进制颜色值
 *  @param alpha  透明度
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
