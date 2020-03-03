
//
//  JKMyViewController.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKMyViewController.h"
#import "JKAboutViewController.h"
#import "JKJianViewController.h"
#import "JKMeCell.h"
@interface JKMyViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UIImageView *bgView;
@property (nonatomic, strong) UIImageView *headBtn;
@property (nonatomic, strong) UILabel *nameLB;
@property (nonatomic, strong) UITableView *setTableView;
@property (nonatomic, copy) NSString *cacheStr;
@property (nonatomic, strong) UILabel *rightCahLB;
@property (nonatomic, strong) UIButton *bottomBtn;

@end

@implementation JKMyViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"我的",nil);
    self.view.backgroundColor = WHITCOLOR;
    [self creatTopUI];
    [self.view addSubview:self.setTableView];
}

- (void)creatTopUI {
    
    _bgView = [[UIImageView alloc]init];
    [self.view addSubview:_bgView];
    _bgView.image = [UIImage imageNamed:@"图层 1"];
    _bgView.userInteractionEnabled = YES;
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (iPhoneX_Serious) {
            make.top.mas_equalTo(88);
        } else {
            make.top.mas_equalTo(64);
        }
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(135);
    }];
    
    _headBtn = [[UIImageView alloc]init];
    [_bgView addSubview:_headBtn];
    _headBtn.userInteractionEnabled = YES;
    [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(80);
        make.centerX.mas_equalTo(_bgView);
        make.width.height.mas_equalTo(80);
    }];
    [_headBtn layoutIfNeeded];
    _headBtn.layer.cornerRadius = 30;
    _headBtn.layer.masksToBounds = YES;
    _headBtn.image = [UIImage imageNamed:@"tx"];
    
    _nameLB = [[UILabel alloc]init];
    [_bgView addSubview:_nameLB];
    _nameLB.userInteractionEnabled = YES;
    _nameLB.backgroundColor = [UIColor clearColor];
    _nameLB.text = NSLocalizedString(@"账号：18705905955",nil);
    _nameLB.textColor = ssRGBOK;
    _nameLB.font = [UIFont systemFontOfSize:17];
    [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(15);
        make.top.mas_equalTo(_headBtn.mas_bottom).offset(10);
        make.centerX.mas_equalTo(_headBtn);
    }];
}

- (UITableView *)setTableView {
    
    if (!_setTableView) {
        
        _setTableView = [[UITableView alloc]init];
        [self.view addSubview:_setTableView];
        _setTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _setTableView.delegate = self;
        _setTableView.dataSource = self;
        _setTableView.scrollEnabled = NO;
        [_setTableView registerClass:[JKMeCell class] forCellReuseIdentifier:@"JKMeCell"];
        [_setTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(_bgView.mas_bottom).offset(60);
            make.height.mas_equalTo(45*4);
        }];
        
        _bottomBtn = [[UIButton alloc]init];
        [self.view addSubview:_bottomBtn];
        [_bottomBtn setTitleColor:[MCColor whiteColor] forState:0];
        _bottomBtn.backgroundColor = ssRGBOK;
        [_bottomBtn addTarget:self action:@selector(onClickedOKbtn) forControlEvents:UIControlEventTouchUpInside];
        [_bottomBtn setTitle:NSLocalizedString(@"退出登录",nil) forState:0];
        _bottomBtn.layer.cornerRadius = 5;
        _bottomBtn.layer.masksToBounds = YES;
        [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.height.mas_equalTo(45);
            make.top.mas_equalTo(_setTableView.mas_bottom).offset(36);
        }];
    }
    return _setTableView;
}

#pragma mark -- UITableviewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JKMeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JKMeCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 3) {
        
        cell.leftImg.image = [UIImage imageNamed:@""];
        cell.leftLB.text = NSLocalizedString(@"意见建议",nil);
    } else if (indexPath.row == 2) {
        
        cell.leftImg.image = [UIImage imageNamed:@""];
        cell.leftLB.text = NSLocalizedString(@"清除缓存",nil);
        cell.rightImg.hidden = YES;
        
        if (!_rightCahLB) {
            
            _rightCahLB = [[UILabel alloc]init];
            _rightCahLB.font = [UIFont systemFontOfSize:16];
            _rightCahLB.backgroundColor = [UIColor clearColor];
            _rightCahLB.textColor = [UIColor blackColor];
            _rightCahLB.textAlignment = NSTextAlignmentRight;
            [cell addSubview: _rightCahLB];
            [_rightCahLB mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.right.mas_equalTo(cell.mas_right).offset(-15);
                make.centerY.mas_equalTo(cell);
                make.width.mas_equalTo(100);
            }];
            NSString *libPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
            CGFloat fileSize = [self folderSizeAtPath:libPath];
            _cacheStr = [NSString stringWithFormat:@"%.2fM",fileSize];
            _rightCahLB.text = _cacheStr;
        }
        
    } else if (indexPath.row == 1) {
        
        cell.leftImg.image = [UIImage imageNamed:@""];
        cell.leftLB.text = NSLocalizedString(@"关于我们",nil);
    } else if (indexPath.row == 0) {
        
        cell.leftImg.image = [UIImage imageNamed:@"分享"];
        cell.leftLB.text = NSLocalizedString(@"分享",nil);
//    } else if (indexPath.row == 4) {
//
//        cell.leftImg.image = [UIImage imageNamed:@"联系我们"];
//        cell.leftLB.text = NSLocalizedString(@"联系我们",nil);
//    } else if (indexPath.row == 5) {
//
//        cell.leftImg.image = [UIImage imageNamed:@"联系我们"];
//        cell.leftLB.text = NSLocalizedString(@"去评价",nil);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        
        JKJianViewController *VC = [[JKJianViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    } else if (indexPath.row == 1) {
        
        JKAboutViewController *VC = [[JKAboutViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    } else if (indexPath.row == 2) {
        
        [self action];
        NSString *libPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
        CGFloat fileSize = [self folderSizeAtPath:libPath];
        _cacheStr = [NSString stringWithFormat:@"%.2fM",fileSize];
        _rightCahLB.text = _cacheStr;
        [YJProgressHUD showMessage:NSLocalizedString(@"清除缓存成功！",nil)];
    } else if (indexPath.row == 0) {
        
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
//    } else if (indexPath.row == 4) {
//
//        NSMutableString *str = [[NSMutableString alloc]initWithFormat:@"tel:%@",@"13950345109"];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
//    } else if (indexPath.row == 5) {
//
//        NSString * urlStr = [NSString stringWithFormat: @"https://itunes.apple.com/cn/app/id%@?mt=8",@"1499931530"];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
    }
}

#pragma mark -- 清除缓存
- (float ) folderSizeAtPath:(NSString*) folderPath {
    
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}

- (long long)fileSizeAtPath:(NSString*) filePath {
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]){
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

- (void)action {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [paths lastObject];
    
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:path];
    
    for (NSString *p in files) {
        NSError *error;
        NSString *Path = [path stringByAppendingPathComponent:p];
        if ([[NSFileManager defaultManager] fileExistsAtPath:Path]) {
            if (![Path containsString:@"Preferences"]) {
                [[NSFileManager defaultManager] removeItemAtPath:Path error:&error];
            }
        }else{
            
        }
    }
}

// 退出登录回调
- (void)onClickedOKbtn {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"userName"];
    [userDefaults removeObjectForKey:@"password"];
    [userDefaults synchronize];
    JKLoginViewController *VC = [[JKLoginViewController alloc]init];
    [self presentViewController:VC animated:YES completion:nil];
}

@end
