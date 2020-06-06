//
//  BSBaseComponent.m
//  moduleDemo
//
//  Created by 隋帮林 on 2019/4/18.
//  Copyright © 2019 Kingsoft. All rights reserved.
//

#import "BSBaseComponent.h"
#import <objc/runtime.h>

@implementation BSBaseComponent

+ (instancetype)component
{
    @synchronized (self) {
        id instance = objc_getAssociatedObject(self, _cmd);
        if (!instance) {
            instance = [[self alloc] init];
            objc_setAssociatedObject(self, _cmd, instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return instance;
    }
}




@end
