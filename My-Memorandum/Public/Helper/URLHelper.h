//
//  URLHelper.h
//  moduleDemo
//
//  Created by 隋帮林 on 2019/4/22.
//  Copyright © 2019 Kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  URL 解析类
 */
@interface URLHelper : NSObject

/**
 *  scheme
 */
@property (nonatomic, copy, readonly) NSString * _Nullable scheme;

/**
 *  host
 */
@property (nonatomic, copy, readonly) NSString * _Nullable host;

/**
 *  path
 */
@property (nonatomic, copy, readonly) NSString * _Nullable path;

/**
 *  URL 中的参数列表
 */
@property (nonatomic, copy, readonly) NSDictionary * _Nullable params;

/**
 *  URL String
 */
@property (nonatomic, copy, readonly) NSString * _Nullable absoluteString;

/**
 *  从 URL 字符串创建 URLEntity
 *
 *  @param urlString url
 *
 *  @return 对应的 URLEntity
 */
+ (instancetype _Nullable )URLWithString:(NSString * _Nonnull)urlString;

@end
