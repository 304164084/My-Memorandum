//
//  BSBaseModel.m
//  FreePlay
//
//  Created by 隋帮林 on 2019/5/6.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import "BSBaseModel.h"
#import <objc/runtime.h>

@implementation BSBaseModel

- (nonnull id)copyWithZone:(nullable NSZone *)zone
{
    return [self actionCopy];
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone { 
    return [self actionCopy];
}

// FIXME: 如果属性中存在可变类型，无法真正copy该属性.
- (instancetype)actionCopy
{
    Class selfClass = [self class];
    id model = [[selfClass alloc] init];
    unsigned int count = 0;
    
    objc_property_t *properties = class_copyPropertyList(selfClass, &count);
    for (unsigned int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        //
        unsigned int attrCount = 0;
        objc_property_attribute_t *attributes = property_copyAttributeList(property, &attrCount);
        for (int j = 0; j < attrCount; j++) {
            objc_property_attribute_t attribute = attributes[j];
            const char *name = attribute.name;
            // strcmp 返回值为0 则相等
            if (strcmp(name, "T") != 0) {
                continue;
            }
            
            const char *value = attribute.value;
            if (strcmp(value, "@\"NSArray\"") == 0) {
                NSLog(@"name: %s, value: %s", name, value);
            }
        }
        
        // 赋值
        id value = [self valueForKey:propertyName];
        if (value) {
            [model setValue:value forKey:propertyName];
        }
    }
    free(properties);
    
    return model;
}

@end
