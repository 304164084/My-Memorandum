//
//  NSString+BSAdditionalFunction.h
//  FreePlay
//
//  Created by 隋帮林 on 2019/5/5.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import <Foundation/Foundation.h>

inline static BOOL isEmptyString (NSString *str) {
    if (![str isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    if (str.length > 0) {
        return NO;
    }
    
    return YES;
}

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BSAdditionalFunction)



@end

NS_ASSUME_NONNULL_END
