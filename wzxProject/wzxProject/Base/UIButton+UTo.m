//
//  UIButton+UTo.m
//  UToHitchhike
//
//  Created by tomodel on 2016/10/23.
//  Copyright © 2016年 tomodel. All rights reserved.
//

#import "UIButton+UTo.h"
#import <objc/runtime.h>

@implementation UIButton (UTo)

+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title tag:(NSInteger)tag target:(id)target action:(SEL)selector {
    
    UIButton *button          = [[UIButton alloc] initWithFrame:frame];
    button.titleLabel.font    = [UIFont fontWithName:@"Avenir-Book" size:16.f];
    button.layer.borderWidth  = 1.f;
    button.layer.cornerRadius = 3.f;
    button.tag                = tag;
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColor] forState:state];
}

- (void)setHighlightedImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateHighlighted];
}

- (UIImage *)highlightedImage {
    
    return [self imageForState:UIControlStateHighlighted];
}

- (void)setSelectedImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateSelected];
}

- (UIImage *)selectedImage {
    
    return [self imageForState:UIControlStateSelected];
}

- (void)setNormalImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateNormal];
}

- (UIImage *)normalImage {
    
    return [self imageForState:UIControlStateNormal];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)setEnlargeEdge:(CGFloat) size {
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left {
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setImagePosition:(UToImagePosition)postion spacing:(CGFloat)spacing {
    
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    switch (postion) {
        case UToImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case UToImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            break;
            
        case UToImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
        case UToImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
            
        default:
            break;
    }
}
@end
