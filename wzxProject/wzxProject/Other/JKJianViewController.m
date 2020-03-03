
//
//  JKJianViewController.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKJianViewController.h"

@interface JKJianViewController ()<UIGestureRecognizerDelegate,UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIImageView *leftImg;
@property (nonatomic, strong) UITextField *qqteexfild;
@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, strong) UIView *bgView;

@end

@implementation JKJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITCOLOR;
    self.title = NSLocalizedString(@"意见建议",nil);
    
    _textView = [[UITextView alloc]init];
    [self.view addSubview:_textView];
    _textView.backgroundColor = [MCColor backWhiteColor];
    _textView.font = [UIFont systemFontOfSize:15];
    _textView.textColor = [MCColor blackColor];
    _textView.layer.cornerRadius = 1;
    _textView.layer.borderColor = ssRGBOK.CGColor;
    _textView.layer.borderWidth = 1;
    _textView.editable = YES;
    _textView.scrollEnabled = YES;
    _textView.delegate = self;
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(260);
        if (iPhoneX_Serious) {
            make.top.mas_equalTo(88+20);
        } else {
            make.top.mas_equalTo(64+20);
        }
    }];
    
    _placeholderLabel = [[UILabel alloc]init];
    [_textView addSubview:_placeholderLabel];
    [_placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(5);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(260);
        make.height.mas_equalTo(30);
    }];
    _placeholderLabel.text = NSLocalizedString(@"请输入您的意见与建议",nil);
    _placeholderLabel.textColor = [MCColor grayColor];
    _placeholderLabel.font = [UIFont systemFontOfSize:16];
    
    _bottomBtn = [[UIButton alloc]init];
    [self.view addSubview:_bottomBtn];
    [_bottomBtn setTitleColor:[MCColor whiteColor] forState:0];
    _bottomBtn.backgroundColor = ssRGBOK;
    [_bottomBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBtn setTitle:NSLocalizedString(@"确定",nil) forState:0];
    _bottomBtn.layer.cornerRadius = 5;
    _bottomBtn.layer.masksToBounds = YES;
    [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_textView);
        make.right.mas_equalTo(_textView);
        make.height.mas_equalTo(45);
        make.top.mas_equalTo(_textView.mas_bottom).offset(50);
    }];
}

- (void)textViewDidChange:(UITextView *)textView {
    
    if (_textView.text.length != 0) {
        
        _placeholderLabel.hidden = YES;
    } else {
        _placeholderLabel.hidden = NO;
    }
}

- (void)btnClicked {
    
    if (_textView.text.length<=0) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请输入您的意见与建议",nil)];
    } else {
        
        [YJProgressHUD showLoading:NSLocalizedString(@"提交中...",nil)];
        NSTimer *timer = [NSTimer timerWithTimeInterval:2.3 target:self selector:@selector(doSome) userInfo:nil repeats:NO];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    }
}

- (void)doSome {
    
    [YJProgressHUD hideHUD];
    [YJProgressHUD showMessage:NSLocalizedString(@"提交成功",nil)];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
