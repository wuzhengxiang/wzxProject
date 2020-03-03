//
//  MCColor.h
//  MovingCompany
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 

NS_ASSUME_NONNULL_BEGIN

@interface MCColor : NSObject

/**
 *导航栏按钮背景颜色
 */
+ (UIColor *)navigationBarBackColor;

/**
 *导航栏标题颜色
 */
+ (UIColor *)navigationBarTitleColor;

/**
 *按钮标题颜色
 */
+ (UIColor *)buttonTitleColor;

/**
 *标题颜色
 */
+ (UIColor *)titleColor;

/**
 *中等标题颜色
 */
+ (UIColor *)midTitleColor;

/**
 *小标题颜色
 */
+ (UIColor *)minTitleColor;

/**
 *内容颜色
 */
+ (UIColor *)infoTitleColor;

/**
 *标题白色
 */
+ (UIColor *)titleWhiteColor;

/**
 *标题黑色
 */
+ (UIColor *)titleBlackColor;

/**
 *标题蓝色
 */
+ (UIColor *)titleBlueColor;

/**
 *分割线用色
 */
+ (UIColor *)separatelineGrayColor;

/**
 *底部线用色
 */
+ (UIColor *)bottomlineGrayColor;

/**
 *背景白色
 */
+ (UIColor *)backWhiteColor;

/**
 *背景灰色
 */
+ (UIColor *)backGrayColor;

/**
 *主色调（绿色）
 */
+ (UIColor *)greenColor;

/**
 *辅色红
 */
+ (UIColor *)redColor;

/**
 * 将李仓库背景黑色1
 *
 **/
+(UIColor *)liCangKuColorOne;

/**
 * 将李仓库背景黑色2
 *
 **/
+(UIColor *)liCangKuColorTwo;

/**
 *辅色橙
 */
+ (UIColor *)orangeColor;

/**
 *黑
 */
+ (UIColor *)blackColor;

/**
 *灰
 */
+ (UIColor *)grayColor;

/**
 *白
 */
+ (UIColor *)whiteColor;

/**
 *遮罩颜色
 */
+ (UIColor *)hideViewColor;

/**
 *  背景灰
 */
+ (UIColor *)backgroundGrayColor;

/**
 *  黄
 *
 */
+ (UIColor *)yellowColor;

/**
 * 导航蓝
 *
 **/
+(UIColor *)navgationBlueColorWithColor;

/**
 *返回Button的纯色背景Image
 */
+ (UIImage *)imageWithColor:(UIColor *)color Rect:(CGRect)rect;

/**
 * 将16进制颜色制传换成color
 *
 **/
+(UIColor *)colorWithHexString:(NSString *)color;

+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 * 将UIColor变换为UIImage
 *
 **/
+ (UIImage *)createImageWithColor:(UIColor *)color;

/**
 * 将UIColor 变深
 *
 **/
+(UIColor *)deepColorWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
