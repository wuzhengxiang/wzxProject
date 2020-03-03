
//
//  JKAboutViewController.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKAboutViewController.h"

@interface JKAboutViewController ()
@property (nonatomic, strong) UIImageView *logoImg;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *bottomLB;
@end

@implementation JKAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"关于我们",nil);
    self.view.backgroundColor = [MCColor backgroundGrayColor];
    _logoImg = [[UIImageView alloc]init];
    [self.view addSubview:_logoImg];
    _logoImg.image = [UIImage imageNamed:@"icon"];
    _logoImg.layer.cornerRadius = 12;
    _logoImg.layer.masksToBounds = YES;
    [_logoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(266);
        make.width.height.mas_equalTo(70);
    }];
    
    _titleLB = [[UILabel alloc]init];
    [self.view addSubview:_titleLB];
    _titleLB.backgroundColor = [UIColor clearColor];
    _titleLB.text = NSLocalizedString(@"小柯宠物寄养 1.0",nil);
    _titleLB.textColor = [MCColor blackColor];
    _titleLB.font = [UIFont systemFontOfSize:16];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(_logoImg);
        make.top.mas_equalTo(_logoImg.mas_bottom).offset(10);
        make.height.mas_equalTo(35);
    }];
    
    UILabel *contentLB = [[UILabel alloc]init];
    [self.view addSubview:contentLB];
    contentLB.backgroundColor = [UIColor clearColor];
    contentLB.text = NSLocalizedString(@"",nil);
    contentLB.textColor = [MCColor blackColor];
    contentLB.font = [UIFont systemFontOfSize:16];
    contentLB.textAlignment = NSTextAlignmentCenter;
    contentLB.numberOfLines = 0;
    [contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(_titleLB);
        make.top.mas_equalTo(_titleLB.mas_bottom).offset(26);
        make.height.mas_equalTo(136);
        make.left.mas_equalTo(26);
    }];
    
    _bottomLB = [[UILabel alloc]init];
    [self.view addSubview:_bottomLB];
    _bottomLB.backgroundColor = [UIColor clearColor];
    _bottomLB.textColor = [MCColor blackColor];
    _bottomLB.text = @"Copyright ©2019 xiaokeji. All right reserved";
    _bottomLB.font = [UIFont systemFontOfSize:13];
    [_bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(-30);
        make.height.mas_equalTo(20);
    }];
}

@end
