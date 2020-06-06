//
//  BSComponentManager.h
//  moduleDemo
//
//  Created by 隋帮林 on 2019/4/18.
//  Copyright © 2019 Kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSBaseComponent.h"

NS_ASSUME_NONNULL_BEGIN

@interface BSComponentManager : NSObject

/**
 *  当前已经注册的组件
 */
+ (NSArray<BSBaseComponent *> *)components;

/**
 *  使用默认的 plist 文件进行注册，默认名字为 `components.plist` (在 mainbundle 根目录下)
 */
+ (void)registerComponentsFromDefaultPlist;

/**
 *  使用自定义的 plist 文件进行注册
 *
 *  @param plistName 如果名字不带 .plist 后缀的话，会自动补上该后缀
 */
+ (void)registerComponentsFromCustomizedPlist:(NSString *)plistName;

/**
 *  推荐使用 plist 来进行注册，方便管理，如果出于某些原因，不想那么做，那么可以直接调用这个方法
 *
 *  @param components 传进来的都是 MGJBaseComponent 的单例
 */
+ (void)registerComponents:(NSArray <BSBaseComponent *> *)components;

@end

NS_ASSUME_NONNULL_END
