
//
//  JKJiLuViewController.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKJiLuViewController.h"
#import "JKFabuViewController.h"
@interface JKJiLuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView0;
@property (nonatomic, strong) NSArray *array1;
@property (nonatomic, strong) NSArray *array2;
@property (nonatomic, strong) NSArray *array3;
@property (nonatomic, strong) NSArray *array4;
@property (nonatomic, strong) NSArray *array5;

@end

@implementation JKJiLuViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"寄养记录",nil);
    self.view.backgroundColor = WHITCOLOR;
    [YJProgressHUD showLoading:NSLocalizedString(@"加载中...",nil)];
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.3 target:self selector:@selector(doSome) userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    _array1 = @[@"寄养-小胖蓝猫",@"寄养-乖乖柯基",@"寄养-可爱博美",@"寄养-治愈柴犬",@"寄养-美美波斯",@"寄养-胖胖英短"];
    _array2 = @[@"5天",@"6天",@"3天",@"2天",@"3天",@"3天"];
    _array3 = @[@"2020-02-27",@"2020-02-26",@"2020-02-23",@"2020-02-21",@"2020-02-19",@"2020-02-16"];
    UIButton *releaseButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 36, 20)];
    [releaseButton setTitle:NSLocalizedString(@"发布",nil) forState:UIControlStateNormal];
    releaseButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [releaseButton setTintColor:[MCColor blackColor]];
    [releaseButton setTitleColor:[MCColor whiteColor] forState:0];
    [releaseButton addTarget:self action:@selector(onClickedOKbtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *releaseButtonItem = [[UIBarButtonItem alloc] initWithCustomView:releaseButton];
    self.navigationItem.rightBarButtonItem = releaseButtonItem;
}

- (void)onClickedOKbtn {
    
    JKFabuViewController *VC = [[JKFabuViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)doSome {
    
    [YJProgressHUD hideHUD];
    [self.view addSubview:self.tableView0];
}

- (UITableView *)tableView0 {
    
    if (!_tableView0) {
        
        _tableView0 = [[UITableView alloc]init];
        [self.view addSubview:_tableView0];
        _tableView0.backgroundColor = [MCColor backgroundGrayColor];
        _tableView0.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView0.delegate = self;
        _tableView0.dataSource = self;
        _tableView0.scrollEnabled = YES;
        _tableView0.tag = 100;
        [_tableView0 registerClass:[JKHomeCell class] forCellReuseIdentifier:@"JKHomeCell"];
        _tableView0.showsVerticalScrollIndicator = NO;
        _tableView0.showsHorizontalScrollIndicator = NO;
        [_tableView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.mas_equalTo(0);
            if (iPhoneX_Serious) {
                make.top.mas_equalTo(88+10);
            } else {
                make.top.mas_equalTo(65+10);
            }
            make.bottom.mas_equalTo(0);
        }];
    }
    return _tableView0;
}

#pragma mark -- UITableviewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 166;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JKHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JKHomeCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.statusLB.text = [NSString stringWithFormat:@"%@",_array1[indexPath.row]];
    cell.topLB.text = [NSString stringWithFormat:@"寄养天数：%@",_array2[indexPath.row]];
    cell.timeLB.text = [NSString stringWithFormat:@"%@",_array3[indexPath.row]];
    cell.btnLB.hidden = YES;
    cell.rowImg.hidden = YES;
    
    if (indexPath.row == 0) {
        
        cell.topImg.image = [UIImage imageNamed:@"蓝猫"];
    } else if (indexPath.row == 1) {
        
        cell.topImg.image = [UIImage imageNamed:@"柯基"];
    } else if (indexPath.row == 2) {
        
        cell.topImg.image = [UIImage imageNamed:@"博美"];
    } else if (indexPath.row == 3) {
        
        cell.topImg.image = [UIImage imageNamed:@"柴犬"];
    } else if (indexPath.row == 4) {
        
        cell.topImg.image = [UIImage imageNamed:@"波斯"];
    } else if (indexPath.row == 5) {
        
        cell.topImg.image = [UIImage imageNamed:@"英短"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
