//
//  JKAddCell.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKAddCell.h"

@implementation JKAddCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = WHITCOLOR;
        [self creatUI];
        self.appearUnderline = YES;
        self.lineToleftSpace = YES;
        self.lintTorightSpace = YES;
    }
    return self;
}

- (void)creatUI {
    
    _leftLB = [[UILabel alloc]init];
    _leftLB.font = [UIFont systemFontOfSize:17];
    _leftLB.backgroundColor = [UIColor clearColor];
    _leftLB.textColor = [MCColor blackColor];
    _leftLB.textAlignment = NSTextAlignmentLeft;
    [self addSubview: _leftLB];
    [_leftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(self);
        make.height.mas_equalTo(19);
        make.width.mas_equalTo(116);
    }];
    
    _rightTF = [[UITextField alloc]init];
    _rightTF.font = [UIFont systemFontOfSize:16];
    _rightTF.backgroundColor = [UIColor clearColor];
    _rightTF.textColor = [MCColor blackColor];
    _rightTF.textAlignment = NSTextAlignmentLeft;
    [self addSubview: _rightTF];
    [_rightTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_leftLB.mas_right).offset(35);
        make.centerY.mas_equalTo(self);
        make.height.mas_equalTo(_leftLB);
        make.right.mas_equalTo(-10);
    }];
}

@end
