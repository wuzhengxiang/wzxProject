//
//  UToSelectHeadImgView.h
//  UtoPassenger
//
//  Created by wufeng on 17/5/24.
//  Copyright © 2017年 uto. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UToSelectHeadImgView;

typedef void (^camerClickBlock)(UIButton *button);                                              // 相机按钮的block

typedef void (^photoClickBlock)(UIButton *button);                                              // 照片按钮的block

@interface UToSelectHeadImgView : UIView

// 按钮的回调方法
- (void)camerBtnClick:(camerClickBlock)block;

- (void)photoBtnClick:(photoClickBlock)block;


@end
