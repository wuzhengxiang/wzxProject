
//
//  JKHandViewController.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKHandViewController.h"
@interface JKHandViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) UIButton *bottomBtn;

@end

@implementation JKHandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"预约详情",nil);
    self.view.backgroundColor = [MCColor backgroundGrayColor];
}

@end
