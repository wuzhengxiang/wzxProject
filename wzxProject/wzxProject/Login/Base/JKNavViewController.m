
//
//  JKNavViewController.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKNavViewController.h"

@interface JKNavViewController ()<UINavigationControllerDelegate>
@property (nonatomic, weak) id popDelegate;

@end

@implementation JKNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
    //navigationBar样式设置
    self.navigationBar.barTintColor = ssRGBOK;//MAIN_GROUNDCOLOR;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : WHITCOLOR, NSFontAttributeName : [UIFont boldSystemFontOfSize:18]}];
    [self.navigationBar setTintColor:WHITCOLOR];    // Do any additional setup after loading the view.
}

//解决手势失效问题
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

//push时隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

//设置样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

//设置返回按钮样式
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemAction)];// 返回
    viewController.navigationItem.backBarButtonItem = backBarButtonItem;
    
}

- (void)backBarButtonItemAction
{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
