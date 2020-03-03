//
//  UToAlert.m
//  UToHitchhike
//
//  Created by tomodel on 2016/10/24.
//  Copyright © 2016年 tomodel. All rights reserved.
//

#import "UToAlert.h"

NSString * const sxalertTitleKey = @"sxalertTitleKey";
NSString * const sxalertContentKey = @"sxalertContentKey";
NSString * const sxalertcancelKey = @"sxalertcancelKey";
NSString * const sxalertokKey = @"sxalertokKey";

@interface  UToAlert()

@property(nonatomic,strong)NSDictionary * infoDic;
@property(nonatomic,assign)BOOL showing;

@end

@implementation UToAlert

+ (instancetype)AlertTitle:(NSString *)title content:(NSString *)content cancelButton:(NSString *)canceltitle okButton:(NSString *)oktitle complete:(SXAlertCompleteBlock)block{
    UToAlert * al = [[UToAlert alloc]init];
    al.completeBlock = block;
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    
    if (title) {
        [dic setValue:title forKey:sxalertTitleKey];
    }
    if (content) {
        [dic setValue:content forKey:sxalertContentKey];
    }
    if (canceltitle) {
        [dic setValue:canceltitle forKey:sxalertcancelKey];
    }
    if (oktitle) {
        [dic setValue:oktitle forKey:sxalertokKey];
    }
    if (dic.count>0) {
        al.infoDic = [dic copy];
    }
    return al;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        self.completeBlock(YES);
    }
    _showing = NO;
}

- (UIAlertView *)alertView{
    UIAlertView * av = nil;
    if (self.infoDic.count>0) {
        av = [[UIAlertView alloc]initWithTitle:_infoDic[sxalertTitleKey] message:_infoDic[sxalertContentKey] delegate:self cancelButtonTitle:_infoDic[sxalertcancelKey] otherButtonTitles:_infoDic[sxalertokKey], nil];
    }
    return av;
}

- (UIAlertController *)alertController{
    UIAlertController * ac = nil;
    if (self.infoDic.count>0) {
        ac = [UIAlertController alertControllerWithTitle:_infoDic[sxalertTitleKey] message:_infoDic[sxalertContentKey] preferredStyle:UIAlertControllerStyleAlert];
        NSString * canceltitle = _infoDic[sxalertcancelKey];
        __typeof(self) __weak wself = self;
        if (canceltitle) {
            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:canceltitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                if (wself.completeBlock) {
                    
                    wself.completeBlock(NO);
                }
                
                wself.showing = NO;
            }];
            [ac addAction:cancelAction];
        }
        NSString * oktitle = _infoDic[sxalertokKey];
        if (oktitle) {
            UIAlertAction * okAction = [UIAlertAction actionWithTitle:oktitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (wself.completeBlock) {
                    
                    wself.completeBlock(YES);
                }
                wself.showing = NO;
            }];
            [ac addAction:okAction];
        }
    }
    return ac;
}

- (void)showAlertWithController:(UIViewController *)controller{
    // iOS8 下需要使用新的 API
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        UIAlertController * ac = [self alertController];
        [controller presentViewController:ac animated:YES completion:nil];
        _showing = ac != nil;
    }else {
        UIAlertView * av = [self alertView];
        [av show];
        _showing = av != nil;
        
    }
}

- (BOOL)isShow{
    return _showing;
}


@end
