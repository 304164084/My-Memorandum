//
//  UITableView+BSAdditionalProperty.h
//  FreePlay
//
//  Created by Banglin on 2019/4/27.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (BSAdditionalProperty)

/** 存放cell的高度 */
@property (nonatomic, strong) NSMutableDictionary *cellHeightDictionary;

@end

NS_ASSUME_NONNULL_END
