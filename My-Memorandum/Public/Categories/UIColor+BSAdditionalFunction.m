//
//  UIColor+BSAdditionalFunction.m
//  FreePlay
//
//  Created by 隋帮林 on 2019/5/5.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import "UIColor+BSAdditionalFunction.h"

@implementation UIColor (BSAdditionalFunction)

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    return [self colorWithHexString:hexString alpha:1];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    return [UIColor marlColorWithHexString:hexString alpha:alpha];
}

+ (UIColor *)marlColorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    UIColor *color = nil;
    
    if (hexString.length == 0) {
        return [UIColor whiteColor];
    }
    
    if('#' != [hexString characterAtIndex:0])
    {
        hexString = [NSString stringWithFormat:@"#%@", hexString];
    }
    
    
    if (hexString.length == 7 || hexString.length == 4) {
        hexString = [self hexStringTransformFromThreeCharacters:hexString];
        
        NSString *redHex    = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(1, 2)]];
        unsigned redInt = [self hexValueToUnsigned:redHex];
        
        NSString *greenHex  = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(3, 2)]];
        unsigned greenInt = [self hexValueToUnsigned:greenHex];
        
        NSString *blueHex   = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(5, 2)]];
        unsigned blueInt = [self hexValueToUnsigned:blueHex];
        
        color = [UIColor colorWithRed:redInt / 255.0 green:greenInt / 255.0 blue:blueInt / 255.0 alpha:alpha];
    }
    else {
        color = [UIColor whiteColor];
    }
    
    return color;
}

+ (NSString *)hexStringTransformFromThreeCharacters:(NSString *)hexString
{
    if(hexString.length == 4)
    {
        hexString = [NSString stringWithFormat:@"#%@%@%@%@%@%@",
                     [hexString substringWithRange:NSMakeRange(1, 1)],[hexString substringWithRange:NSMakeRange(1, 1)],
                     [hexString substringWithRange:NSMakeRange(2, 1)],[hexString substringWithRange:NSMakeRange(2, 1)],
                     [hexString substringWithRange:NSMakeRange(3, 1)],[hexString substringWithRange:NSMakeRange(3, 1)]];
    }
    
    return hexString;
}

+ (unsigned)hexValueToUnsigned:(NSString *)hexValue
{
    unsigned value = 0;
    
    NSScanner *hexValueScanner = [NSScanner scannerWithString:hexValue];
    [hexValueScanner scanHexInt:&value];
    
    return value;
}

@end
