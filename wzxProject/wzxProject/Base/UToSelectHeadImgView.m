//
//  UToSelectHeadImgView.m
//  UtoPassenger
//
//  Created by wufeng on 17/5/24.
//  Copyright © 2017年 uto. All rights reserved.
//

#import "UToSelectHeadImgView.h"

@interface UToSelectHeadImgView ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *bottomBackgroundView;                     // 底部视图

@property (nonatomic, strong) UIImageView *camerImg;                            // 相机图片

@property (nonatomic, strong) UIImageView *photoImg;                               // 照片图片

@property (nonatomic, strong) UILabel *camerLabel;                               // 相机按钮

@property (nonatomic, strong) UILabel *photoLabel;                               // 照片按钮

@property (nonatomic, copy) camerClickBlock camerBlock;

@property (nonatomic, copy) photoClickBlock photoBlock;


@end

@implementation UToSelectHeadImgView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.3f];
        [self creatBottomView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [tap addTarget:self action:@selector(hide)];
        [self addGestureRecognizer:tap];
        [self show];
        tap.delegate = self;
    }
    return self;
}

// 创建底部视图
- (void)creatBottomView {
    
    self.bottomBackgroundView = [[UIView alloc]init];
    self.bottomBackgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bottomBackgroundView];
    [self.bottomBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@(0));
        make.right.equalTo(@(0));
        make.height.equalTo(@(140));
        make.bottom.equalTo(@(0));
    }];
    
    UIButton *camerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_bottomBackgroundView addSubview:camerBtn];
    [camerBtn setTitle:NSLocalizedString(@"拍照",nil) forState:0];
    camerBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [camerBtn setTitleColor:ssRGBOK forState:0];
    [camerBtn setImage:[UIImage imageNamed:@"拍照"] forState:0];
    [camerBtn setImage:[UIImage imageNamed:@"拍照"] forState:UIControlStateHighlighted];
    [camerBtn addTarget:self action:@selector(camerClicked) forControlEvents:UIControlEventTouchUpInside];
    [camerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(30);
        make.bottom.mas_equalTo(-33);
        make.width.mas_equalTo(100);//100
        make.height.mas_equalTo(50);
        make.left.mas_equalTo(70);
    }];
    [camerBtn layoutIfNeeded];
    UIImageView *imageView = camerBtn.imageView;
    UILabel *titleLabel = camerBtn.titleLabel;
    camerBtn.imageEdgeInsets = UIEdgeInsetsMake(-titleLabel.intrinsicContentSize.height*0.5, titleLabel.intrinsicContentSize.width*0.5, titleLabel.intrinsicContentSize.height*0.5, -titleLabel.intrinsicContentSize.width*0.5);
    camerBtn.titleEdgeInsets = UIEdgeInsetsMake(imageView.intrinsicContentSize.height*0.6, -imageView.intrinsicContentSize.width*0.5, -imageView.intrinsicContentSize.height*0.6, imageView.intrinsicContentSize.width*0.5);
    
    UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_bottomBackgroundView addSubview:photoBtn];
    [photoBtn setTitle:NSLocalizedString(@"相册",nil) forState:0];
    photoBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [photoBtn setTitleColor:ssRGBOK forState:0];
    [photoBtn setImage:[UIImage imageNamed:@"相册(1)拷贝"] forState:0];
    [photoBtn setImage:[UIImage imageNamed:@"相册(1)拷贝"] forState:UIControlStateHighlighted];
    [photoBtn addTarget:self action:@selector(photoClicked) forControlEvents:UIControlEventTouchUpInside];
    [photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(30);
        make.bottom.mas_equalTo(-33);
        make.width.mas_equalTo(camerBtn);
        make.height.mas_equalTo(camerBtn);
        make.right.mas_equalTo(-70);
    }];
    [photoBtn layoutIfNeeded];
    UIImageView *imgView = photoBtn.imageView;
    UILabel *tleLabel = photoBtn.titleLabel;
    photoBtn.imageEdgeInsets = UIEdgeInsetsMake(-tleLabel.intrinsicContentSize.height*0.5, tleLabel.intrinsicContentSize.width*0.5, tleLabel.intrinsicContentSize.height*0.5, -tleLabel.intrinsicContentSize.width*0.5);
    photoBtn.titleEdgeInsets = UIEdgeInsetsMake(imgView.intrinsicContentSize.height*0.6, -imgView.intrinsicContentSize.width*0.5, -imgView.intrinsicContentSize.height*0.6, imgView.intrinsicContentSize.width*0.5);
} 

// 显示
- (void)show {
    
    self.bottomBackgroundView.transform = CGAffineTransformMakeTranslation(0, 200);
    WEAKSELF
    [UIView animateWithDuration:0.35 animations:^{
        
        STRONGSELF
        strongSelf.alpha = 1.0f;
        strongSelf.bottomBackgroundView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
    }];
}

// 隐藏
- (void)hide {
    
    WEAKSELF
    [UIView animateWithDuration:0.35 animations:^{
        
        STRONGSELF
        strongSelf.alpha = 0.3f;
        strongSelf.bottomBackgroundView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(strongSelf.bottomBackgroundView.frame));
        
    } completion:^(BOOL finished) {
        
        [weakSelf removeFromSuperview];
    }];
}

// 按钮的回调方法
- (void)camerClicked {// 相机
    
    if (self.camerBlock) {
        
        self.camerBlock(nil);
        [self hide];
    }
}

- (void)camerBtnClick:(camerClickBlock)block{
    
    self.camerBlock = block;
}

- (void)photoClicked {// 相册
    
    if (self.photoBlock) {
        
        self.photoBlock(nil);
        [self hide];
    }
}

- (void)photoBtnClick:(photoClickBlock)block {
    
    self.photoBlock = block;
}

// 不让子视图响应父视图手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if ([touch.view isDescendantOfView:_bottomBackgroundView] ) {
        
        return NO;
    }
    return YES;
}


@end
