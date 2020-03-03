//
//  SCBaseCell.h
//  SCProject
//
//  Created by mac on 2020/2/17.
//  Copyright © 2020 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCBaseCell : UITableViewCell
@property (nonatomic, assign) BOOL appearUnderline;// 显示下滑线,默认为no
@property (nonatomic, assign) BOOL lineToleftSpace;// 是否对左边有空间隔 yes表示没有
@property (nonatomic, assign) BOOL lintTorightSpace;// 是否对右边有空间隔 yes表示没有
@property (nonatomic, strong) UIColor *lineColor;//  底边颜色

@end

NS_ASSUME_NONNULL_END
