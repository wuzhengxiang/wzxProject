//
//  UToVerifyCodeButton.m
//  UtoPassenger
//
//  Created by wufeng on 2017/6/14.
//  Copyright © 2017年 uto. All rights reserved.
//

#import "UToVerifyCodeButton.h"
#import "UToLabel.h"

@interface UToVerifyCodeButton () {
    
    __block int _timeout;
}

@property (nonatomic, strong) UToLabel * verificationCodeLabel;

@end

@implementation UToVerifyCodeButton

// 初始化
- (void)initializeInfo {
    [super initializeInfo];
    
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = 0.3;
    self.layer.borderColor = nil;
    self.layer.borderWidth = 0.0f;
    self.backgroundColor = [UIColor greenColor];
}

// 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.verificationCodeLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

// 开始倒计时
- (BOOL)startCountdown:(UInt32)countdown {
    
    [self.verificationCodeLabel removeFromSuperview];
    self.verificationCodeLabel = [[UToLabel alloc]init];
    self.verificationCodeLabel.backgroundColor = ssRGBOK;//[UIColor backGrayColor];
    self.verificationCodeLabel.layer.cornerRadius = self.layer.cornerRadius;
    self.verificationCodeLabel.textColor = [UIColor grayColor];
    self.verificationCodeLabel.font = [UIFont systemFontOfSize:15];
    self.verificationCodeLabel.textAlignment = NSTextAlignmentCenter;
    self.verificationCodeLabel.layer.masksToBounds = YES;
    self.verificationCodeLabel.clipsToBounds = YES;
    [self addSubview:self.verificationCodeLabel];
    self.timeout=countdown; //倒计时时间
    
    WEAKSELF
    self.enabled = NO;
    self.layer.borderColor = ssRGBOK.CGColor;//[UIColor backGrayColor].CGColor;
    self.userInteractionEnabled = NO;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        
        if (weakSelf == nil) {
            
            dispatch_source_cancel(_timer);
        }
        if(weakSelf.timeout<=0) { //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                [weakSelf.verificationCodeLabel removeFromSuperview];
                weakSelf.verificationCodeLabel = nil;
                weakSelf.enabled = YES;
                weakSelf.layer.borderColor = [UIColor orangeColor].CGColor;
                weakSelf.userInteractionEnabled = YES;
            });
        } else {
            
            //            int minutes = timeout / 60;
            NSString *strTime = [NSString stringWithFormat:@"%d", weakSelf.timeout];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                // SXLog(@"____%@",strTime);
                weakSelf.verificationCodeLabel.text = [NSString stringWithFormat:NSLocalizedString(@"%@s 后重新获取",nil),strTime];
            });
            weakSelf.timeout--;
        }
    });
    dispatch_resume(_timer);
    return YES;
}

// 停止倒计时
- (BOOL)stopCountdown {
    
    _timeout = 0;
    return YES;
}


@end
