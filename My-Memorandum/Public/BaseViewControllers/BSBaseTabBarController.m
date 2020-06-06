//
//  BSBaseTabBarController.m
//  FreePlay
//
//  Created by Banglin on 2019/4/25.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import "BSBaseTabBarController.h"
#import "BSBaseNavigationController.h"

@interface BSBaseTabBarController ()

@end

@implementation BSBaseTabBarController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupDefaultConfigration];
}

- (void)setupDefaultConfigration
{
    self.view.backgroundColor = [UIColor whiteColor];
    // 通过appearance统一设置UITabbarItem的文字属性
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.0];  // 设置文字大小
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];  // 设置文字的前景色
    
    NSMutableDictionary * selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    UITabBarItem * item = [UITabBarItem appearance];  // 设置appearance
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)setupViews
{
    // 设置nav
    NSArray *tabBarItemsName = @[@"首页", @"标签-1", @"标签-2", @"标签-3"];
    NSArray *tabBarItemsIconNormal = @[@"tab_home_n", @"tab_search_n", @"tab_shop_n", @"tab_account_n"];
    NSArray *tabBarItemsIconSelected = @[@"tab_home_sel", @"tab_search_sel", @"tab_shop_sel", @"tab_account_sel"];
    NSArray *tabBarItemsVC = @[@"ViewController", @"BSPrivateIdeaViewController", @"ViewController", @"ViewController"];
    
    [tabBarItemsVC enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIImage *normalImage = [UIImage imageNamed:tabBarItemsIconNormal[idx]];
        UIImage *selectedImage = [UIImage imageNamed:tabBarItemsIconSelected[idx]];
        
        UIViewController *vc = [[NSClassFromString(tabBarItemsVC[idx]) alloc] init];
        vc.tabBarItem.title = tabBarItemsName[idx];
        vc.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        vc.navigationItem.title = tabBarItemsName[idx];
        BSBaseNavigationController *nvc = [[BSBaseNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nvc];
    }];
}


@end
