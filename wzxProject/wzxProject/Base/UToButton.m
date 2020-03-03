//
//  UToButton.m
//  UToHitchhike
//
//  Created by tomodel on 2016/10/24.
//  Copyright © 2016年 tomodel. All rights reserved.
//

#import "UToButton.h"

@implementation UToButton

+ (instancetype)baseButtonWithFrame:(CGRect)frame image:(UIImage *)image HighlightImage:(UIImage *)highlighImage {
    
    UToButton * button = [[UToButton alloc]initWithFrame:frame];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlighImage forState:UIControlStateHighlighted];
    return button;
}

+ (instancetype)baseButtonWithFrame:(CGRect)frame title:(NSString *)title selectTitle:(NSString *)sTitle titleColor:(UIColor *)color selectTitleColor:(UIColor *)selectColor {
    
    UToButton * button = [[UToButton alloc]initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitle:sTitle forState:UIControlStateSelected];
    [button setTitleColor:selectColor forState:UIControlStateSelected];
    
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    return button;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        [self initializeInfo];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self initializeInfo];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initializeInfo];
    }
    return self;
}

- (void)initializeInfo {
    
    [self setExclusiveTouch:YES];
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
