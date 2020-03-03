//
//  UToVerifyCodeButton.h
//  UtoPassenger
//
//  Created by wufeng on 2017/6/14.
//  Copyright © 2017年 uto. All rights reserved.
//

#import "UToButton.h"

@interface UToVerifyCodeButton : UToButton

@property (nonatomic, assign) int timeout;

// 开始倒计时
- (BOOL)startCountdown:(UInt32)countdown;

// 停止倒计时
- (BOOL)stopCountdown;


@end
