//
//  wzxHeader.h
//  wzxProject
//
//  Created by mac on 2020/3/3.
//  Copyright © 2020 mac. All rights reserved.
//

#ifndef wzxHeader_h
#define wzxHeader_h

#define HEXCOLOR(h)                     [MCColor colorWithHexString:h]
#define HEXCOLOR2(h,a)                  [MCColor colorWithHexString:h alpha:a]
#define ssRGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

#define ssRGBAlpha(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
#define WHITCOLOR [UIColor whiteColor]
#define ssRGBOK ssRGB(253, 96, 140)
#define ssRGBRed ssRGB(243, 243, 243)

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//判断是否是iPhone4s
#define IS_IPHONE4S (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)
//判断是否是iPhone5
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
//判断是否是iPhone6、iPhone7
#define IS_IPHONE6 (([[UIScreen mainScreen] bounds].size.height-667)?NO:YES)
//判断是否是iPhone6plush、7plus
#define IS_IPHONE6_PLUS (([[UIScreen mainScreen] bounds].size.height-736)?NO:YES)
//判断是否是iPhoneX
#define IS_IPhoneX ([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f)

//是否iPhone X 系列 用于判断是否有刘海
#define iPhoneX_Serious ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)

//是否iPhone X 系列 兼容老代码 新代码判断是否有刘海请使用iPhoneX_Serious判断 单独判断iphoneX使用iphoneX_X
#define iPhoneX iPhoneX_Serious
//判断iPhoneX、iPhoneXs 逻辑点375*812
#define iphoneX_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define iphoneX_Xs  iphoneX_X
//判断iPHoneXr  逻辑点414*896
#define iphoneX_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXs Max   逻辑点414*896
#define iphoneX_XsMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define WEAKSELF __weak typeof(self) weakSelf = self;// 弱引用
#define STRONGSELF __strong typeof(weakSelf) strongSelf = weakSelf;
#endif /* wzxHeader_h */
