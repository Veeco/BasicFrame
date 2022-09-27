//
//  BaseTabBarController.m
//  PuChi
//
//  Created by Veeco on 2017/11/14.
//  Copyright © 2017年 Chance. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeVC.h"
#import "ContentVC.h"
#import "MessageVC.h"
#import "DiscoveryVC.h"
#import "MineVC.h"
#import "BaseNavigationController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化UI
    [self setupUI];
    
    // 添加子VC
    [self addChildVC];
}

/**
 初始化UI
 */
- (void)setupUI {
    
    // tabBar元素
    NSMutableDictionary *atts = [NSMutableDictionary dictionary];
    atts[NSForegroundColorAttributeName] = [UIColor colorWithRed:220 / 255.0f green:220 / 255.0f blue:220 / 255.0f alpha:1];
    atts[NSFontAttributeName] = [UIFont boldSystemFontOfSize:15];
    
    NSMutableDictionary *selectedAtts = [NSMutableDictionary dictionary];
    selectedAtts[NSForegroundColorAttributeName] = [UIColor colorWithRed:94 / 255.0f green:184 / 255.0f blue:106 / 255.0f alpha:1];
    selectedAtts[NSFontAttributeName] = atts[NSFontAttributeName];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAtts forState:UIControlStateSelected];
    
    // tabBar背景
    UITabBar *tabBar = [UITabBar appearance];
    tabBar.backgroundColor = [UIColor colorWithRed:242 / 255.0f green:242 / 255.0f blue:242 / 255.0f alpha:1];
}

/**
 添加子VC
 */
- (void)addChildVC {
    
    // 1. 首页
    [self addChildVC:[HomeVC new] title:@"首页" image:@"" selectedImage:@""];
    
    // 2. 内容
    [self addChildVC:[ContentVC new] title:@"内容" image:@"" selectedImage:@""];
    
    // 3. 消息
    [self addChildVC:[MessageVC new] title:@"消息" image:@"" selectedImage:@""];
    
    // 4. 发现
    [self addChildVC:[DiscoveryVC new] title:@"发现" image:@"" selectedImage:@""];
    
    // 5. 我的
    [self addChildVC:[MineVC new] title:@"我的" image:@"" selectedImage:@""];
}

/**
 具体添加子VC

 @param VC 子VC
 @param title 子VC标题
 @param image tabBar图案
 @param selectedImage tabBar被选中图案
 */
- (void)addChildVC:(UIViewController *)VC  title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
     
    VC.tabBarItem.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:image];
    VC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:VC];
    VC.title = title;
    
    [self addChildViewController:nav];
}

@end
