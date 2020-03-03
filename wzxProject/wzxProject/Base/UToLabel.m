//
//  UToLabel.m
//  UToHitchhike
//
//  Created by tomodel on 2016/10/23.
//  Copyright © 2016年 tomodel. All rights reserved.
//

#import "UToLabel.h"
#define LeftMargin                      15.f
#define RigthMargin                     15.f

@implementation UToLabel

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.font = [UIFont systemFontOfSize:16];
        self.adjustsFontSizeToFitWidth = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    
    if (self) {
        
        self.font = [UIFont systemFontOfSize:16];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.font = [UIFont systemFontOfSize:16];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    if (_appearUnderline) {
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(ctx, [UIColor grayColor].CGColor);  // set as the text's color
        CGContextSetLineWidth(ctx, 1.0f);
        CGPoint leftPoint;
        
        if (_underlineLiftMargin) {
            
            leftPoint = CGPointMake(LeftMargin, self.frame.size.height);
        } else {
        
            leftPoint = CGPointMake(0, self.frame.size.height);
        }
        CGPoint rightPoint;
        
        if (_underlineRigthMargin) {
            
            rightPoint = CGPointMake(self.frame.size.width-RigthMargin, self.frame.size.height);
        } else {
        
            rightPoint = CGPointMake(self.frame.size.width, self.frame.size.height);
        }
        CGContextMoveToPoint(ctx, leftPoint.x, leftPoint.y);
        CGContextAddLineToPoint(ctx, rightPoint.x, rightPoint.y);
        CGContextStrokePath(ctx);
    }
}

@end
