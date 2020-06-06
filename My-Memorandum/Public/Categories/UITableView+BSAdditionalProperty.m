//
//  UITableView+BSAdditionalProperty.m
//  FreePlay
//
//  Created by Banglin on 2019/4/27.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import "UITableView+BSAdditionalProperty.h"
#import <objc/runtime.h>

@implementation UITableView (BSAdditionalProperty)


- (void)setCellHeightDictionary:(NSMutableDictionary *)cellHeightDictionary
{
    objc_setAssociatedObject(self, @selector(cellHeightDictionary), cellHeightDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)cellHeightDictionary
{
    return objc_getAssociatedObject(self, _cmd);
}

@end
