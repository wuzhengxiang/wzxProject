//
//  UToButton.h
//  UToHitchhike
//
//  Created by tomodel on 2016/10/24.
//  Copyright © 2016年 tomodel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+UTo.h"

@interface UToButton : UIButton

+ (instancetype)baseButtonWithFrame:(CGRect)frame image:(UIImage *)image HighlightImage:(UIImage *)highlighImage;
+ (instancetype)baseButtonWithFrame:(CGRect)frame title:(NSString *)title selectTitle:(NSString *)sTitle titleColor:(UIColor *)color selectTitleColor:(UIColor *)selectColor;

-(void)initializeInfo;

@end
