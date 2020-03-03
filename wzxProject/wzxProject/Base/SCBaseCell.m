
//
//  SCBaseCell.m
//  SCProject
//
//  Created by mac on 2020/2/17.
//  Copyright © 2020 mac. All rights reserved.
//

#import "SCBaseCell.h"

@implementation SCBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initializeInfo];
    }
    return self;
}
    
- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self initializeInfo];
    }
    return self;
}
    
- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    
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
    self.contentView.backgroundColor = [UIColor clearColor];
    UIView * vv = [[UIView alloc]initWithFrame:self.bounds];
    vv.backgroundColor = WHITCOLOR;
    self.selectedBackgroundView = vv;
}
    
- (void)setAppearUnderline:(BOOL)appearUnderline {
    
    if (_appearUnderline == appearUnderline) {
        
        return;
    }
    _appearUnderline = appearUnderline;
    [self setNeedsDisplay];
}
    
- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    if (_appearUnderline && !_lineColor) {
        
        CGContextRef ctf = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(ctf, [MCColor separatelineGrayColor].CGColor);
        CGContextSetStrokeColorWithColor(ctf, [MCColor separatelineGrayColor].CGColor);
        
        if (_lineToleftSpace) {
            
            CGContextMoveToPoint(ctf, 0, rect.size.height);
        } else {
            
            CGContextMoveToPoint(ctf, 10, rect.size.height);
        }
        
        if (_lintTorightSpace) {// !_lintTorightSpace
            
            CGContextAddLineToPoint(ctf, rect.size.width, rect.size.height);
        } else {
            
            CGContextAddLineToPoint(ctf, rect.size.width-10, rect.size.height);
        }
        CGContextDrawPath(ctf, kCGPathFillStroke);
    }
}

@end
