//
//  AppDelegate+ViewController.m
//  MyApp
//
//  Created by liaowentao on 17/3/29.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "AppDelegate+ViewController.h"

@implementation AppDelegate (ViewController)

- (void)setAppWindows
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self.window makeKeyAndVisible];

}

- (void)setRootViewController {
    
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSString *name = [userDefaults objectForKey:@"userName"];
//    NSString *password = [userDefaults objectForKey:@"password"];
//
//    if (name==nil) {// 登录界面
//
//        LXLoginViewController *vc = [[LXLoginViewController alloc]init];
//        UINavigationController *NV = [[UINavigationController alloc]initWithRootViewController:vc];
//        NV.navigationBar.barTintColor = ssRGBOK;
//        [NV.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : WHITCOLOR, NSFontAttributeName : [UIFont boldSystemFontOfSize:18]}];
//        [NV.navigationBar setTintColor:WHITCOLOR];
//        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
//                                    [UIFont systemFontOfSize:0.0001],NSFontAttributeName,nil];
//        [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
//        self.window.rootViewController = NV;
//        [self.window makeKeyAndVisible];
//    } else {
    
        JKRootViewController *vc = [[JKRootViewController alloc]init];
        self.window.rootViewController = vc;
        [self.window makeKeyAndVisible];
//    }
}
@end
