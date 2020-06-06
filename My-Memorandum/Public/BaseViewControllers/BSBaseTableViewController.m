//
//  BSBaseTableViewController.m
//  FreePlay
//
//  Created by Banglin on 2019/4/25.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import "BSBaseTableViewController.h"
#import "UITableView+BSAdditionalProperty.h"

@interface BSBaseTableViewController ()

// FIXME: 也许没必要，后面再考虑是否移除
/** cell's id */
@property (nonatomic, copy) NSString *defaultCellID;

@end

@implementation BSBaseTableViewController

- (instancetype)init
{
    if (self = [super init]) {
        // code...
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    [self setupViews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 自定义控件
- (void)setupViews
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.bottom.equalTo(self.view);
    }];
}

#pragma mark - datasource & delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 缓存高度
    [tableView.cellHeightDictionary setObject:@(cell.frame.size.height) forKey:indexPath];
}

#pragma mark - getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
    }
    return _tableView;
}

- (NSString *)defaultCellID
{
    if (!_defaultCellID) {
        _defaultCellID = [NSString stringWithFormat:@"%@", NSStringFromClass([self class])];
    }
    return _defaultCellID;
}


@end
