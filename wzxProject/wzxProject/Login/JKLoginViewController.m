
//
//  JKLoginViewController.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKLoginViewController.h"

@interface JKLoginViewController ()<UIGestureRecognizerDelegate,UITextFieldDelegate> {
    
    NSString *_accountStr;
}

@property (nonatomic, strong) UIImageView *topImg;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIImageView *left1Img;
@property (nonatomic, strong) UITextField *phoneTF;
@property (nonatomic, strong) UIImageView *left2Img;
@property (nonatomic, strong) UITextField *passwordTF;
@property (nonatomic, strong) UToVerifyCodeButton *verificationButton;
@property (nonatomic, strong) UIButton *agressLB;
@property (nonatomic, strong) UIButton *backBtn;

@end

@implementation JKLoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WHITCOLOR;
    _topImg = [[UIImageView alloc]init];
    [self.view addSubview:_topImg];
    _topImg.image = [UIImage imageNamed:@"图层 1-1"];
    _topImg.userInteractionEnabled = YES;
    [_topImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(0);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    _backBtn = [[UIButton alloc]init];
    [_topImg addSubview:_backBtn];
    [_backBtn setImage:[UIImage imageNamed:@"形状1"] forState:0];
    [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(30);
        make.width.height.mas_equalTo(36);
        make.top.mas_equalTo(60);
    }];
    [self creatUI];
}

- (void)backBtnClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)creatUI {
    
    UIImageView *bg1View = [[UIImageView alloc]init];
    [_topImg addSubview:bg1View];
    bg1View.userInteractionEnabled = YES;
    bg1View.layer.cornerRadius = 25;
    bg1View.backgroundColor = ssRGBOK;
    [bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (iPhoneX_Serious) {
            make.top.mas_equalTo(330);
        } else {
            make.top.mas_equalTo(260);
        }
        make.height.mas_equalTo(50);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(25);
    }];
    
    _phoneTF = [[UITextField alloc]init];
    [bg1View addSubview:_phoneTF];
    _phoneTF.placeholder = NSLocalizedString(@"请输入您的手机号",nil);
    _phoneTF.backgroundColor = [UIColor clearColor];
    _phoneTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(bg1View);
        make.height.mas_equalTo(25);
        make.right.mas_equalTo(-10);
    }];
    
    UIImageView *bg2View = [[UIImageView alloc]init];
    [self.view addSubview:bg2View];
    bg2View.userInteractionEnabled = YES;
    bg2View.layer.cornerRadius = 25;
    bg2View.backgroundColor = ssRGBOK;
    [bg2View mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(bg1View.mas_bottom).offset(30);
        make.height.mas_equalTo(bg1View);
        make.centerX.mas_equalTo(bg1View);
        make.left.mas_equalTo(bg1View);
    }];
    
    _passwordTF = [[UITextField alloc]init];
    [bg2View addSubview:_passwordTF];
    _passwordTF.placeholder = NSLocalizedString(@"请输入验证码",nil);
    _passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordTF.backgroundColor = ssRGBOK;
    _passwordTF.secureTextEntry = YES;
    _passwordTF.keyboardType = UIKeyboardTypeASCIICapable;
    [_passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_phoneTF);
        make.centerY.mas_equalTo(bg2View);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(136);
    }];
    
    _verificationButton = [[UToVerifyCodeButton alloc]init];
    [bg2View addSubview:_verificationButton];
    [_verificationButton setTitle:NSLocalizedString(@"获取验证码",nil) forState:UIControlStateNormal];
    _verificationButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_verificationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _verificationButton.layer.cornerRadius = 5;
    _verificationButton.backgroundColor = ssRGBOK;
    [_verificationButton addTarget:self action:@selector(getCodeClicked) forControlEvents:UIControlEventTouchUpInside];
    [_verificationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
        make.centerY.mas_equalTo(bg2View);
        make.right.mas_equalTo(-15);
    }];
    
    _loginBtn = [[UIButton alloc]init];
    [self.view addSubview:_loginBtn];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:0];
    _loginBtn.backgroundColor = ssRGBOK;
    [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _loginBtn.layer.cornerRadius = 25;
    _loginBtn.layer.masksToBounds = YES;
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(bg1View);
        make.right.mas_equalTo(bg1View);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(bg2View.mas_bottom).offset(40);
    }];
    [_loginBtn setTitle:NSLocalizedString(@"免注册登录",nil) forState:0];
    
    _agressLB = [[UIButton alloc]init];
    [self.view addSubview:_agressLB];
    [_agressLB setTitleColor:[MCColor grayColor] forState:0];
    
    NSString *text = NSLocalizedString(@"登录即同意《小柯宠物寄养协议》",nil);
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange allStr = [text rangeOfString:NSLocalizedString(@"登录即同意《小柯宠物寄养协议》",nil)];
    NSDictionary *attributesDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17],NSFontAttributeName,[MCColor blackColor],NSForegroundColorAttributeName,nil];
    [str setAttributes:attributesDic range:allStr];
    NSRange strRange = [text rangeOfString:NSLocalizedString(@"《小柯宠物寄养协议》",nil)];
    NSDictionary *attriDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17],NSFontAttributeName,[MCColor blackColor],NSForegroundColorAttributeName,nil];
    [str setAttributes:attriDic range:strRange];
    //[str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];// 添加下划线
    [_agressLB setAttributedTitle:str forState:UIControlStateNormal];
    
    [_agressLB setTitle:@"" forState:0];
    _agressLB.titleLabel.font = [UIFont systemFontOfSize:17];
    [_agressLB addTarget:self action:@selector(tapclick) forControlEvents:UIControlEventTouchUpInside];
    [_agressLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(35);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(_loginBtn.mas_bottom).offset(35);
    }];
}

- (void)tapclick {
    
    JKWebViewController *VC = [[JKWebViewController alloc]init];
    [self presentViewController:VC animated:YES completion:nil];
}

// 获取验证码
- (void)getCodeClicked {
    
    _accountStr = _phoneTF.text;
    
    if (!(_accountStr.length>0)) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请输入您的手机号",nil)];
    } else if (![_accountStr isMobileNumber]) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"输入手机号有误",nil)];
    } else {
        
        [self.verificationButton startCountdown:60];
    }
}

- (void)loginBtnClick {
    
    _accountStr = _phoneTF.text;
    NSString *passwordStr = _passwordTF.text;
    
    if (!(_accountStr.length>0)) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请输入您的手机号",nil)];
    } else if (![_accountStr isMobileNumber]) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"输入手机号有误",nil)];
    } else if (passwordStr.length<=0) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请输入验证码",nil)];
    } else {
        
        if ([_accountStr isEqualToString:@"18705905955"] && [passwordStr isEqualToString:@"123456"]) {
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:_accountStr forKey:@"userName"];
            [userDefaults setObject:passwordStr forKey:@"password"];
            [userDefaults synchronize];
            JKRootViewController *VC = [[JKRootViewController alloc]init];
            [self presentViewController:VC animated:YES completion:nil];
        } else {
            
            [YJProgressHUD showMessage:NSLocalizedString(@"您输入的手机号或验证码不正确",nil)];
        }
    }
}

@end
