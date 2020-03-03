//
//  JKMeCell.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKMeCell.h"

@implementation JKMeCell

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
    
    //    _leftImg = [[UIImageView alloc]init];
    //    [self addSubview: _leftImg];
    //    [_leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
    //
    //        make.left.mas_equalTo(15);
    //        make.centerY.mas_equalTo(self);
    //        make.width.height.mas_equalTo(20);
    //    }];
    _leftLB = [[UILabel alloc]init];
    _leftLB.font = [UIFont systemFontOfSize:16];
    _leftLB.backgroundColor = [UIColor clearColor];
    _leftLB.textColor = [UIColor blackColor];
    _leftLB.textAlignment = NSTextAlignmentLeft;
    [self addSubview: _leftLB];
    [_leftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //make.left.mas_equalTo(_leftImg.mas_right).offset(10);
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(self);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(230);
    }];
    
    _rightImg = [[UIImageView alloc]init];
    _rightImg.image = [UIImage imageNamed:@"更多"];
    [self addSubview: _rightImg];
    [_rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(_leftLB);
        make.width.height.mas_equalTo(10);
    }];
}

@end
