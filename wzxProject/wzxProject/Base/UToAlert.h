//
//  UToAlert.h
//  UToHitchhike
//
//  Created by tomodel on 2016/10/24.
//  Copyright © 2016年 tomodel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UToAlert : NSObject <UIAlertViewDelegate>

typedef void (^SXAlertCompleteBlock)(BOOL isOk);

@property(nonatomic,copy)SXAlertCompleteBlock completeBlock;

+ (instancetype)AlertTitle:(NSString *)title content:(NSString *)content cancelButton:(NSString *)canceltitle okButton:(NSString *)oktitle complete:(SXAlertCompleteBlock)block;

- (void)showAlertWithController:(UIViewController *)controller;

- (BOOL)isShow;


@end
