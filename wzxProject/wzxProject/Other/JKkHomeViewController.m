
//
//  JKkHomeViewController.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKkHomeViewController.h"
#import "JKHandViewController.h"
@interface JKkHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView0;
@property (nonatomic, strong) NSArray *array1;
@property (nonatomic, strong) NSArray *array2;
@property (nonatomic, strong) NSArray *array3;
@property (nonatomic, strong) NSArray *array4;
@property (nonatomic, strong) NSArray *array5;
@property (nonatomic, strong) UIImageView *topImage;
@property (nonatomic, strong) UILabel *titleLB;

@end

@implementation JKkHomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"首页",nil);
    self.view.backgroundColor = [MCColor backgroundGrayColor];
    _topImage = [[UIImageView alloc]init];
    [self.view addSubview:_topImage];
    _topImage.image = [UIImage imageNamed:@"banner"];
    [_topImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        if (iPhoneX_Serious) {
            make.top.mas_equalTo(88+16);
        } else {
            make.top.mas_equalTo(64+16);
        }
        make.height.mas_equalTo(170);
    }];
    [YJProgressHUD showLoading:NSLocalizedString(@"加载中...",nil)];
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.3 target:self selector:@selector(doSome) userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    _array1 = @[@"厦门金宠宠物店",@"鼓浪屿萌萌宠物店",@"厦门开心宠物店"];
    _array2 = @[@"98%",@"96%",@"96%"];
    _array3 = @[@"厦门思明区观音山97号",@"厦门鼓浪屿文学路267号",@"厦门湖里区枋湖路607号"];
    UIButton *releaseButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 36, 20)];
    [releaseButton setTitle:NSLocalizedString(@"分享",nil) forState:UIControlStateNormal];
    releaseButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [releaseButton setTintColor:[MCColor blackColor]];
    [releaseButton setTitleColor:[MCColor whiteColor] forState:0];
    [releaseButton addTarget:self action:@selector(onClickedOKbtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *releaseButtonItem = [[UIBarButtonItem alloc] initWithCustomView:releaseButton];
    self.navigationItem.rightBarButtonItem = releaseButtonItem;
}

- (void)onClickedOKbtn {
    
    NSString *textToShare = @"";
    NSURL *urlToShare = [NSURL URLWithString:@"http://www.100seait.com/"];
    NSArray *activityItems = @[textToShare,urlToShare];
    UIActivityViewController *activity = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activity.excludedActivityTypes = @[UIActivityTypeMail,UIActivityTypePostToTwitter,UIActivityTypeMessage,UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeAddToReadingList,UIActivityTypePostToFlickr,UIActivityTypePostToVimeo];//,UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop,UIActivityTypeOpenInIBooks
    UIPopoverPresentationController *popover = activity.popoverPresentationController;
    if (popover) {
        //popover.sourceView = self.shareView;
        popover.permittedArrowDirections = UIPopoverArrowDirectionUp;
    }
    [self presentViewController:activity animated:YES completion:NULL];
}

- (void)doSome {
    
    [YJProgressHUD hideHUD];
    [self.view addSubview:self.tableView0];
}

- (UITableView *)tableView0 {
    
    if (!_tableView0) {
        
        _titleLB = [[UILabel alloc]init];
        [self.view addSubview:_titleLB];
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.font = [UIFont systemFontOfSize:21];
        _titleLB.textColor = ssRGBOK;
        _titleLB.text = NSLocalizedString(@"🔸寄养推荐",nil);
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(_topImage.mas_bottom).offset(10);
            make.height.mas_equalTo(16);
            make.left.mas_equalTo(20);
        }];
        
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
            make.top.mas_equalTo(_titleLB.mas_bottom).offset(10);
            make.bottom.mas_equalTo(0);
        }];
    }
    return _tableView0;
}

#pragma mark -- UITableviewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JKHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JKHomeCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.topLB.text = [NSString stringWithFormat:@"好评：%@",_array2[indexPath.row]];
    cell.statusLB.text = [NSString stringWithFormat:@"%@",_array1[indexPath.row]];
    cell.timeLB.text = [NSString stringWithFormat:@"%@",_array3[indexPath.row]];
    if (indexPath.row == 0) {
        
        cell.topImg.image = [UIImage imageNamed:@"123"];
    } else if (indexPath.row == 1) {
        
        cell.topImg.image = [UIImage imageNamed:@"125"];
    } else if (indexPath.row == 2) {
        
        cell.topImg.image = [UIImage imageNamed:@"126"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JKHandViewController *VC = [[JKHandViewController alloc]init];
    if (indexPath.row == 0) {

        VC.nameStr = @"厦门金宠宠物店";
        VC.timeStr = @"98%";
        VC.tianqiStr = @"厦门思明区观音山97号";
        VC.adressStr = @"13623667900";
        VC.tianshuStr = @"猫和狗";
    } else if (indexPath.row == 1) {

        VC.nameStr = @"鼓浪屿萌萌宠物店";
        VC.timeStr = @"96%";
        VC.tianqiStr = @"厦门鼓浪屿文学路267号";
        VC.adressStr = @"18766998867";
        VC.tianshuStr = @"猫和狗";
    } else if (indexPath.row == 2) {

        VC.nameStr = @"厦门开心宠物店";
        VC.timeStr = @"96%";
        VC.tianqiStr = @"厦门湖里区枋湖路607号";
        VC.adressStr = @"17628296867";
        VC.tianshuStr = @"猫和狗";
    }
    [self.navigationController pushViewController:VC animated:YES];
}

@end
