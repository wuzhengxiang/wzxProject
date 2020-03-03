//
//  YJProgressHUD.m
//  Lotto
//
//  Created by apple on 2018/3/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YJProgressHUD.h"
// 背景视图的宽度/高度
#define BGVIEW_WIDTH 100.0f
// 文字大小
#define TEXT_SIZE    15.0f
@implementation YJProgressHUD

+ (instancetype)sharedHUD {
    static id hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[self alloc] initWithView:[UIApplication sharedApplication].keyWindow];
    });
    return hud;
}

+ (void)showStatus:(YJProgressHUDStatus)status text:(NSString *)text {
    
    YJProgressHUD *HUD = [YJProgressHUD sharedHUD];
    HUD.bezelView.color = [UIColor colorWithWhite:0/255.0 alpha:0.5];
    HUD.contentColor=[UIColor whiteColor];
    [HUD showAnimated:YES];
    [HUD setShowNow:YES];
    //蒙版显示 YES , NO 不显示
    //HUD.dimBackground = YES;
    HUD.label.text = text;
    HUD.label.textColor = [UIColor whiteColor];
    [HUD setRemoveFromSuperViewOnHide:YES];
    HUD.label.font = [UIFont boldSystemFontOfSize:TEXT_SIZE];
    [HUD setMinSize:CGSizeMake(BGVIEW_WIDTH, BGVIEW_WIDTH)];
    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    
    switch (status) {
        case YJProgressHUDStatusSuccess: {
            UIImage *sucImage = [UIImage imageNamed:@"MBHUD_Success.png"];
            HUD.mode = MBProgressHUDModeCustomView;
            UIImageView *sucView = [[UIImageView alloc] initWithImage:sucImage];
            HUD.customView = sucView;
            [HUD hideAnimated:YES afterDelay:2.0f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [HUD setShowNow:NO];
            });
        }
            break;
            
        case YJProgressHUDStatusError: {
            UIImage *errImage = [UIImage imageNamed:@"MBHUD_Error.png"];
            HUD.mode = MBProgressHUDModeCustomView;
            UIImageView *errView = [[UIImageView alloc] initWithImage:errImage];
            HUD.customView = errView;
            [HUD hideAnimated:YES afterDelay:2.0f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [HUD setShowNow:NO];
            });
        }
            break;
            
        case YJProgressHUDStatusLoading: {
            HUD.mode = MBProgressHUDModeIndeterminate;
        }
            break;
            
            
        case YJProgressHUDStatusWaitting: {

            UIImage *infoImage = [UIImage imageNamed:@"MBHUD_Info.png"];
            HUD.mode = MBProgressHUDModeCustomView;
            UIImageView *infoView = [[UIImageView alloc] initWithImage:infoImage];
            HUD.customView = infoView;
            [HUD hideAnimated:YES afterDelay:2.0f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [HUD setShowNow:NO];
            });
            
        }
            break;
            
        case YJProgressHUDStatusInfo: {
            UIImage *infoImage = [UIImage imageNamed:@"MBHUD_Info.png"];
            HUD.mode = MBProgressHUDModeCustomView;
            UIImageView *infoView = [[UIImageView alloc] initWithImage:infoImage];
            HUD.customView = infoView;
            [HUD hideAnimated:YES afterDelay:2.0f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [HUD setShowNow:NO];
            });
        }
            break;
            
        default:
            break;
    }
}

+ (void)showMessage:(NSString *)text {
    
    YJProgressHUD *HUD = [YJProgressHUD sharedHUD];
    HUD.bezelView.color = [UIColor colorWithWhite:0/255.0 alpha:0.5];
    [HUD showAnimated:YES];
    [HUD setShowNow:YES];
    HUD.label.text = text;
    HUD.contentColor=[UIColor whiteColor];
    [HUD setMinSize:CGSizeZero];
    [HUD setMode:MBProgressHUDModeText];
    //    HUD.dimBackground = YES;
    [HUD setRemoveFromSuperViewOnHide:YES];
    HUD.label.font = [UIFont boldSystemFontOfSize:TEXT_SIZE];
    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[YJProgressHUD sharedHUD] setShowNow:NO];
        [[YJProgressHUD sharedHUD] hideAnimated:YES];
    });
}

+ (void)showWaiting:(NSString *)text {
    
    [self showStatus:YJProgressHUDStatusWaitting text:text];
}

+ (void)showError:(NSString *)text {
    
    [self showStatus:YJProgressHUDStatusError text:text];
}

+ (void)showSuccess:(NSString *)text {
    
    [self showStatus:YJProgressHUDStatusSuccess text:text];
}

+ (void)showLoading:(NSString *)text {
    
    [self showStatus:YJProgressHUDStatusLoading text:text];
}

+ (void)hideHUD {
    
    [[YJProgressHUD sharedHUD] setShowNow:NO];
    [[YJProgressHUD sharedHUD] hideAnimated:YES];
}


@end
