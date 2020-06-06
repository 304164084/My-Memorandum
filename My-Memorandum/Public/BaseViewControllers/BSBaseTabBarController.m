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

- (void)configTabBarWithTiles:(NSArray<NSString *> *)titles
                 normalImages:(NSArray<NSString *> *)normalImages
               selectedImages:(NSArray<NSString *> *)selectedImages
              viewControllers:(NSArray<UIViewController *> *)viewControllers
{
    [viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIImage *normalImage = [UIImage imageNamed:normalImages[idx]];
        UIImage *selectedImage = [UIImage imageNamed:selectedImages[idx]];
        
        UIViewController *vc = viewControllers[idx];
        vc.tabBarItem.title = titles[idx];
        vc.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        vc.navigationItem.title = titles[idx];
        BSBaseNavigationController *nvc = [[BSBaseNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nvc];
    }];
}


@end
