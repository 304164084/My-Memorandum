//
//  BSBaseTableViewController.h
//  FreePlay
//
//  Created by Banglin on 2019/4/25.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import "BSBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BSBaseTableViewController : BSBaseViewController
<
UITableViewDelegate,
UITableViewDataSource
>

/** tableView */
@property (nonatomic, strong) UITableView *tableView;
// FIXME: 1.上拉下拉刷新控件的控制属性
// FIXME: 2.默认空白页 或 自定义空白页入口

// FIXME: 实现意义不大
//- (void)registerCellClass:(Class)cls forCellReuseIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
