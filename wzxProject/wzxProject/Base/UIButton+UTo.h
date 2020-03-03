//
//  UIButton+UTo.h
//  UToHitchhike
//
//  Created by tomodel on 2016/10/23.
//  Copyright © 2016年 tomodel. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, UToImagePosition) {
    UToImagePositionLeft = 0,               //图片在左，文字在右，默认
    UToImagePositionRight = 1,              //图片在右，文字在左
    UToImagePositionTop = 2,                //图片在上，文字在下
    UToImagePositionBottom = 3              //图片在下，文字在上
};

@interface UIButton (UTo)

/**
 *  创建button
 *
 *  @param frame    frame值
 *  @param title    标题
 *  @param tag      标签
 *  @param target   目标
 *  @param selector 执行句柄
 *
 *  @return 创建好的button
 */
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title tag:(NSInteger)tag
                             target:(id)target action:(SEL)selector;

/**
 *  设置高亮图片
 *
 *  @param image 高亮图片
 */
- (void)setHighlightedImage:(UIImage *)image;

/**
 *  返回高亮图片
 *
 *  @return 高亮图片
 */
- (UIImage *)highlightedImage;

/**
 *  设置普通图片
 *
 *  @param image 普通图片
 */
- (void)setNormalImage:(UIImage *)image;

/**
 *  返回普通图片
 *
 *  @return 普通图片
 */
- (UIImage *)normalImage;

/**
 *  设置选中的图片
 *
 *  @param image 选中的图片
 */
- (void)setSelectedImage:(UIImage *)image;

/**
 *  返回选中的图片
 *
 *  @return 选中的图片
 */
- (UIImage *)selectedImage;


/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

/**
 *  扩大点击热区
 *
 */
- (void)setEnlargeEdge:(CGFloat)size;
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat) bottom left:(CGFloat)left;

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)setImagePosition:(UToImagePosition)postion spacing:(CGFloat)spacing;

@end
