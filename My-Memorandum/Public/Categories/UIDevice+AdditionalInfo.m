//
//  UIDevice+AdditionalInfo.m
//  FreePlay
//
//  Created by Banglin on 2019/4/28.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import "UIDevice+AdditionalInfo.h"

@implementation UIDevice (AdditionalInfo)

+ (BOOL)is_iPhone_X
{
    BOOL result = NO;
    if (@available(iOS 11.0, *)) {
        CGFloat safeBottomHeight = [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
        result = safeBottomHeight > 0.f ? YES : NO;
    } else {
        // Fallback on earlier versions
    }
    return result;
}


@end
