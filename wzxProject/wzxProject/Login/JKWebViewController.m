
//
//  JKWebViewController.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKWebViewController.h"

@interface JKWebViewController ()
@property (nonatomic, strong) UIView *navView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation JKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ssRGBOK;
    _navView = [[UIView alloc]init];
    [self.view addSubview:_navView];
    _navView.backgroundColor = ssRGBOK;
    [_navView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        if (iPhoneX_Serious) {
            
            make.height.mas_equalTo(88);
        } else {
            
            make.height.mas_equalTo(66);
        }
    }];
    
    _titleLabel = [[UILabel alloc]init];
    [_navView addSubview:_titleLabel];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textColor = [MCColor whiteColor];
    _titleLabel.text = NSLocalizedString(@"用户协议及隐私政策",nil);
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(_navView);
        make.centerY.mas_equalTo(_navView.mas_centerY).offset(10);
    }];
    
    _backBtn = [[UIButton alloc]init];
    [_navView addSubview:_backBtn];
    [_backBtn setImage:[UIImage imageNamed:@"下一页"] forState:0];
    [_backBtn addTarget:self action:@selector(backClicked) forControlEvents:UIControlEventTouchUpInside];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.centerY.mas_equalTo(_titleLabel.mas_centerY);
    }];
    [self.view addSubview:self.webView];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://jiushig.vip:8088/zlink/257"]];
    [self.webView loadRequest:request];
}

- (UIWebView *)webView   {
    
    if (!_webView) {
        
        _webView = [[UIWebView alloc] init];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_navView.mas_bottom).offset(0);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(SCREEN_HEIGHT);
        }];
        _webView.dataDetectorTypes = UIDataDetectorTypeAll;
    }
    return _webView;
}

- (void)backClicked {
    
    if (_isNav == YES) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
