
//
//  JKRootViewController.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKRootViewController.h"

@interface JKRootViewController ()<UITabBarControllerDelegate>

@end

@implementation JKRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.translucent     = NO;
    self.tabBar.backgroundImage = [CommonMethods createImageWithColor:[UIColor clearColor]];
    NSArray * normalItems       = @[@"形状 21-2",@"形状 23-1",@"形状 24-2"];
    NSArray * selectItmes       = @[@"形状 21",@"形状 23-2",@"形状 24-1"];
    NSArray * controllClass     = @[@"JKkHomeViewController",@"JKJiLuViewController",@"JKMyViewController"];
    self.delegate               = self;
    NSArray * itemTitles        = @[NSLocalizedString(@"宠物",nil),NSLocalizedString(@"寄养记录",nil),NSLocalizedString(@"我的",nil)];
    NSMutableArray * controllers = [[NSMutableArray alloc]init];
    for (int i = 0; i < normalItems.count; i++)
    {
        UIViewController * homeview =[[NSClassFromString(controllClass[i]) alloc]init];
        JKNavViewController * navigation =[[JKNavViewController alloc]initWithRootViewController:homeview];
        navigation.tabBarItem.image                     = [[UIImage imageNamed:normalItems[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navigation.tabBarItem.selectedImage             = [[UIImage imageNamed:selectItmes[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navigation.tabBarItem.titlePositionAdjustment   = UIOffsetMake(0,-3);
        [controllers addObject:navigation];
        
        // 设置文字的样式
        NSMutableDictionary *textAttrs                  = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName]       = [UIColor blackColor];
        NSMutableDictionary *selectTextAttrs            = [NSMutableDictionary dictionary];
        selectTextAttrs[NSForegroundColorAttributeName] = [UIColor brownColor];
        [homeview.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
        [homeview.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
        // 设置tabbaritem 的title
        navigation.tabBarItem.title                     = itemTitles[i];
        
        // 修改tapbar原生字体颜色
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[MCColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        // 设置字体大小只能在正常状态下设置，所以用了两个字典
        NSMutableDictionary *textSizeDic = [NSMutableDictionary dictionary];
        textSizeDic[NSFontAttributeName] =  [UIFont systemFontOfSize:13.6];
        [[UITabBarItem appearance] setTitleTextAttributes:textSizeDic forState:UIControlStateNormal];
    }
    self.viewControllers = controllers;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    if ([viewController.tabBarItem.title isEqualToString:NSLocalizedString(@"我的",nil)]) {
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *name = [userDefaults objectForKey:@"userName"];
        
        if (name==nil) {// 登录界面
            
            [YJProgressHUD showMessage:NSLocalizedString(@"请先去登录",nil)];
            JKLoginViewController *segVC = [[JKLoginViewController alloc] init];
            [self presentViewController:segVC animated:YES completion:nil];
            return NO;
        } else {
            return YES;
        }
    } else {
        return YES;
    }
    return YES;
}

@end
