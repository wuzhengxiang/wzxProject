//
//  JKHomeCell.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKHomeCell.h"

@implementation JKHomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [MCColor backgroundGrayColor];
        [self creatUI];
        self.appearUnderline = NO;
        self.lineToleftSpace = YES;
        self.lintTorightSpace = NO;
    }
    return self;
}

- (void)creatUI {
    
    _bgView = [[UIView alloc]init];
    _bgView.backgroundColor = [MCColor whiteColor];
    [self addSubview: _bgView];
    _bgView.layer.cornerRadius = 10;
    _bgView.layer.masksToBounds = YES;
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
    }];
    
    _topImg = [[UIImageView alloc]init];
    [_bgView addSubview:_topImg];
    [_topImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(136);
        make.top.mas_equalTo(15);
        make.bottom.mas_equalTo(-15);
    }];
    
    _statusLB = [[UILabel alloc]init];
    _statusLB.font = [UIFont systemFontOfSize:18];
    _statusLB.backgroundColor = [UIColor clearColor];
    _statusLB.textColor = [MCColor redColor];
    _statusLB.textAlignment = NSTextAlignmentLeft;
    [_bgView addSubview: _statusLB];
    _statusLB.text = @"";
    [_statusLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_topImg.mas_right).offset(30);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(18);
        make.top.mas_equalTo(10);
    }];
    
    _topLB = [[UILabel alloc]init];
    _topLB.font = [UIFont systemFontOfSize:18];
    _topLB.backgroundColor = [UIColor clearColor];
    _topLB.textColor = [MCColor blackColor];
    _topLB.textAlignment = NSTextAlignmentLeft;
    [_bgView addSubview: _topLB];
    _topLB.text = @"";
    [_topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_statusLB);
        make.top.mas_equalTo(_statusLB.mas_bottom).offset(10);
        make.height.mas_equalTo(_statusLB);
        make.right.mas_equalTo(_statusLB);
    }];
    
    _timeLB = [[UILabel alloc]init];
    _timeLB.font = [UIFont systemFontOfSize:18];
    _timeLB.backgroundColor = [UIColor clearColor];
    _timeLB.textColor = [MCColor blackColor];
    _timeLB.textAlignment = NSTextAlignmentLeft;
    [_bgView addSubview: _timeLB];
    _timeLB.text = @"";
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_statusLB);
        make.top.mas_equalTo(_topLB.mas_bottom).offset(10);
        make.height.mas_equalTo(_statusLB);
        make.right.mas_equalTo(-60);
    }];
    
    _btnLB = [[UILabel alloc]init];
    _btnLB.font = [UIFont systemFontOfSize:18];
    _btnLB.backgroundColor = ssRGBOK;
    _btnLB.textColor = [MCColor whiteColor];
    _btnLB.layer.cornerRadius = 6;
    _btnLB.layer.masksToBounds = YES;
    _btnLB.textAlignment = NSTextAlignmentCenter;
    [_bgView addSubview: _btnLB];
    _btnLB.text = @"预约";
    [_btnLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(55);
    }];
    
    _rowImg = [[UIImageView alloc]init];
    [_bgView addSubview:_rowImg];
    _rowImg.image = [UIImage imageNamed:@"矩形 11 拷贝 2"];
    [_rowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(_bgView);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(13);
    }];
}

@end
