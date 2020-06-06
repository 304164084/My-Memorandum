//
//  BSBaseViewController.m
//  FreePlay
//
//  Created by Banglin on 2019/4/25.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import "BSBaseViewController.h"

@interface BSBaseViewController ()

@end

@implementation BSBaseViewController

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    [self setupViews];
}

- (void)setupViews {}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupDefaultConfigration_BaseViewController];
    [self setupConfigration];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

#pragma mark 配置
- (void)setupConfigration {}

- (void)setupDefaultConfigration_BaseViewController
{
    // viewcontroller 的顶部与底部不超过navigationbar 和 tabbar
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = BSColor_WhiteLight;
}

@end
