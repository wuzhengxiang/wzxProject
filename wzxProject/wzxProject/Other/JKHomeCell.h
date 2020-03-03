//
//  JKHomeCell.h
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "SCBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface JKHomeCell : SCBaseCell
@property (nonatomic , strong) UIView *bgView;
@property (nonatomic , strong) UIImageView *topImg;
@property (nonatomic , strong) UILabel *topLB;
@property (nonatomic , strong) UILabel *statusLB;
@property (nonatomic , strong) UILabel *timeLB;
@property (nonatomic , strong) UILabel *btnLB;
@property (nonatomic , strong) UIImageView *rowImg;
@end

NS_ASSUME_NONNULL_END
