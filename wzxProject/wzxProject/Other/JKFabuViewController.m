
//
//  JKFabuViewController.m
//  JKeProject
//
//  Created by mac on 2020/2/29.
//  Copyright © 2020 mac. All rights reserved.
//

#import "JKFabuViewController.h"
#import "JKAddCell.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import "UToSelectHeadImgView.h"
@interface JKFabuViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,UITextViewDelegate> {
    
    NSString *selectImg64Str;
    UIImage *mediaType;
    JKAddCell *cell0;
    JKAddCell *cell1;
    JKAddCell *cell2;
    JKAddCell *cell3;
    JKAddCell *cell4;
    JKAddCell *cell5;
}

@property (nonatomic, strong) UITableView *detailTableView;
@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, strong) UIImageView *headBtn;
@property (nonatomic, strong) UToSelectHeadImgView *selectHeadImgView;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, copy) NSString *tagnumStr;

@end

@implementation JKFabuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"发布寄养",nil);
    self.view.backgroundColor = WHITCOLOR;
    [self.view addSubview:self.detailTableView];
    [self.view addSubview:self.bottomBtn];
}

- (UITableView *)detailTableView {
    
    if (!_detailTableView) {
        
        UILabel *btnLB = [[UILabel alloc]init];
        btnLB.font = [UIFont systemFontOfSize:18];
        btnLB.backgroundColor = [MCColor whiteColor];
        btnLB.textColor = ssRGBOK;
        btnLB.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview: btnLB];
        btnLB.text =NSLocalizedString( @"宠物照片：",nil);
        [btnLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(25);
            if (iPhoneX_Serious) {
                make.top.mas_equalTo(88+30);
            } else {
                make.top.mas_equalTo(65+30);
            }
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(116);
        }];
        
        _headBtn = [[UIImageView alloc]init];
        [self.view addSubview:_headBtn];
        _headBtn.userInteractionEnabled = YES;
        _headBtn.image = [UIImage imageNamed:@"形状 1(1)"];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeheadImgClicked)];
        tap.delegate = self;
        [_headBtn addGestureRecognizer:tap];
        [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(self.view);
            if (iPhoneX_Serious) {
                make.top.mas_equalTo(88+60);
            } else {
                make.top.mas_equalTo(65+60);
            }
            make.width.height.mas_equalTo(100);
        }];
        
        _detailTableView = [[UITableView alloc]init];
        [self.view addSubview:_detailTableView];
        _detailTableView.backgroundColor = WHITCOLOR;
        _detailTableView.delegate = self;
        _detailTableView.dataSource = self;
        if (IS_IPHONE6) {
            _detailTableView.scrollEnabled = YES;
        } else {
            _detailTableView.scrollEnabled = NO;
        }
        _detailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _detailTableView.showsVerticalScrollIndicator = NO;
        _detailTableView.showsHorizontalScrollIndicator = NO;
        [_detailTableView registerClass:[JKAddCell class] forCellReuseIdentifier:@"JKAddCell"];
        [_detailTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(_headBtn.mas_bottom).offset(50);
            make.height.mas_equalTo(45*6);
        }];
    }
    return _detailTableView;
}

- (UIButton *)bottomBtn {
    
    if (!_bottomBtn) {
        
        _bottomBtn = [[UIButton alloc]init];
        [self.view addSubview:_bottomBtn];
        _bottomBtn.backgroundColor = ssRGBOK;
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:0];
        _bottomBtn.clipsToBounds = YES;
        _bottomBtn.layer.cornerRadius = 5;
        [_bottomBtn setTitle:NSLocalizedString(@"发布寄养",nil) forState:0];
        [_bottomBtn addTarget:self action:@selector(finishClickedOKbtn) forControlEvents:UIControlEventTouchUpInside];
        _bottomBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(self.view);
            make.width.mas_equalTo(156);
            make.height.mas_equalTo(45);
            make.top.mas_equalTo(_detailTableView.mas_bottom).offset(36);
        }];
    }
    return _bottomBtn;
}

#pragma mark -- UITableviewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        cell0 = [[JKAddCell alloc]init];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        cell0.leftLB.text = NSLocalizedString(@"宠物品种",nil);
        cell0.rightTF.placeholder = NSLocalizedString(@"请输入宠物品种",nil);
        cell0.appearUnderline = NO;
        return cell0;
    } else if (indexPath.row == 1) {
        
        cell1 = [[JKAddCell alloc]init];
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        cell1.leftLB.text = NSLocalizedString(@"宠物性别",nil);
        cell1.rightTF.placeholder = NSLocalizedString(@"请输入宠物性别",nil);
        cell1.appearUnderline = NO;
        return cell1;
    } else if (indexPath.row == 2) {
        
        cell2 = [[JKAddCell alloc]init];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        cell2.leftLB.text = NSLocalizedString(@"宠物年龄",nil);
        cell2.rightTF.placeholder = NSLocalizedString(@"请输入宠物年龄",nil);
        cell2.appearUnderline = NO;
        return cell2;
    } else if (indexPath.row == 3) {
        
        cell3 = [[JKAddCell alloc]init];
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        cell3.leftLB.text = NSLocalizedString(@"寄养时间",nil);
        cell3.rightTF.placeholder = NSLocalizedString(@"请输入寄养时间",nil);
        cell3.appearUnderline = NO;
        return cell3;
    } else if (indexPath.row == 4) {
        
        cell4 = [[JKAddCell alloc]init];
        cell4.selectionStyle = UITableViewCellSelectionStyleNone;
        cell4.leftLB.text = NSLocalizedString(@"绝育情况",nil);
        cell4.rightTF.placeholder = NSLocalizedString(@"请输入绝育情况",nil);
        cell4.appearUnderline = NO;
        return cell4;
    } else if (indexPath.row == 5) {
        
        cell5 = [[JKAddCell alloc]init];
        cell5.selectionStyle = UITableViewCellSelectionStyleNone;
        cell5.leftLB.text = NSLocalizedString(@"寄养天数",nil);
        cell5.rightTF.placeholder = NSLocalizedString(@"请输入寄养天数",nil);
        cell5.appearUnderline = NO;
        return cell5;
    }
    return nil;
}

- (void)finishClickedOKbtn {
    
    if (selectImg64Str.length<=0) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请上传宠物图片",nil)];
    } else if (cell0.rightTF.text.length<=0) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请输入宠物品种",nil)];
    } else if (cell1.rightTF.text.length<=0){
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请输入宠物性别",nil)];
    } else if (cell2.rightTF.text.length<=0) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请输入宠物年龄",nil)];
    } else if (cell3.rightTF.text.length<=0) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请输入寄养时间",nil)];
    } else if (cell4.rightTF.text.length<=0) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请输入绝育情况",nil)];
    } else if (cell5.rightTF.text.length<=0) {
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请输入寄养天数",nil)];
    } else {
        
        [YJProgressHUD showLoading:NSLocalizedString(@"提交中",nil)];
        NSTimer *timer2 = [NSTimer timerWithTimeInterval:2.3 target:self selector:@selector(doSome2) userInfo:nil repeats:NO];
        [[NSRunLoop mainRunLoop] addTimer:timer2 forMode:NSDefaultRunLoopMode];
    }
}

- (void)doSome2 {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefaults objectForKey:@"userName"];
    
    if (name==nil) {// 登录界面
        
        [YJProgressHUD showMessage:NSLocalizedString(@"请先去登录",nil)];
        JKLoginViewController *segVC = [[JKLoginViewController alloc] init];
        [self presentViewController:segVC animated:YES completion:nil];
    } else {
        
        [YJProgressHUD hideHUD];
        [YJProgressHUD showMessage:NSLocalizedString(@"发布成功啦~~",nil)];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma -- PhotoSelect
- (void)changeheadImgClicked {
    
    _selectHeadImgView = [[UToSelectHeadImgView alloc]init];
    [self.view.window addSubview:_selectHeadImgView];
    
    [_selectHeadImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [_selectHeadImgView camerBtnClick:^(UIButton *sender){// 相机
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {//相机权限
                
                if (granted) {
                    
                    UIImagePickerController * imagePickerVC = [[UIImagePickerController alloc]init];
                    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
                    [[UINavigationBar appearance] setBarTintColor:ssRGBOK];//ssRGB(53, 53, 53)背景颜色
                    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];// 返回按钮及其上面他控件颜色
                    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18.0]}];// 标题字体颜色
                    imagePickerVC.allowsEditing = YES;
                    imagePickerVC.modalPresentationStyle = UIModalPresentationCurrentContext;
                    imagePickerVC.delegate = self;
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        [self presentViewController:imagePickerVC animated:YES completion:NULL];
                        //                        self.tabBarController.tabBar.hidden = YES;
                    });
                } else {
                    
                    UToAlert *aler =[UToAlert AlertTitle:@"无法使用相机" content:@"请在iPhone的“设置-隐私-相机”中允许访问相机。" cancelButton:nil okButton:@"确定" complete:nil];
                    [aler showAlertWithController:self];
                }
            }];
        }
    }];
    
    [_selectHeadImgView photoBtnClick:^(UIButton *sender){// 照片
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                
                if (status == PHAuthorizationStatusAuthorized) {
                    
                } else {
                    
                }
                UIImagePickerController * imagePickerVC = [[UIImagePickerController alloc]init];
                imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [[UINavigationBar appearance] setBarTintColor:ssRGBOK];//ssRGB(53, 53, 53)
                [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
                [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18.0]}];
                imagePickerVC.allowsEditing = YES;
                imagePickerVC.modalPresentationStyle = UIModalPresentationCurrentContext;
                imagePickerVC.delegate = self;
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    //                    self.tabBarController.tabBar.hidden = YES;
                    [self presentViewController:imagePickerVC animated:YES completion:NULL];
                });
            }];
        }
    }];
}

// 图片压缩方法
- (NSData *)zipNSDataWithImage:(UIImage *)sourceImage {//进行图像尺寸的压缩
    CGSize imageSize = sourceImage.size;//取出要压缩的image尺寸
    CGFloat width = imageSize.width; //图片宽度
    CGFloat height = imageSize.height; //图片高度 //1.宽高大于1280(宽高比不按照2来算，按照1来算)
    if (width>1280 || height>1280) {
        
        if (width>height) {
            
            CGFloat scale = height/width; width = 1280;
            height = width*scale;
        } else {
            CGFloat scale = width/height; height = 1280;
            width = height*scale;
            
        } //2.宽大于1280高小于1280
    } else if (width>1280 || height<1280) {
        
        CGFloat scale = height/width;
        width = 1280;
        height = width*scale; //3.宽小于1280高大于1280
    } else if (width<1280 || height>1280) {
        
        CGFloat scale = width/height;
        height = 1280; width = height*scale; //4.宽高都小于1280
    }
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [sourceImage drawInRect:CGRectMake(0,0,width,height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext(); UIGraphicsEndImageContext(); //进行图像的画面质量压缩
    NSData *data = UIImageJPEGRepresentation(newImage, 1.0);
    if (data.length>100*1024) {
        
        if (data.length>1024*1024) {//1M以及以上
            
            data = UIImageJPEGRepresentation(newImage, 0.7);
        } else if (data.length>512*1024) {//0.5M-1M
            
            data = UIImageJPEGRepresentation(newImage, 0.8);
        } else if (data.length>200*1024) { //0.25M-0.5M
            
            data = UIImageJPEGRepresentation(newImage, 0.9);
        }
    } return data;
}

// 选完照片回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    mediaType = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSData *data = [self zipNSDataWithImage:mediaType];
    [picker dismissViewControllerAnimated:true completion:^{
        
        NSString *image64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        selectImg64Str = [NSString stringWithFormat:@"data:image/jpeg;base64,%@",image64];
        [_headBtn setImage:mediaType];
        //        self.navigationController.navigationBar.barTintColor = ssRGBOK;
        //        self.tabBarController.tabBar.hidden = NO;
        
        UIImage *image2 = mediaType;
        NSString *path_document = NSHomeDirectory();
        //设置一个图片的存储路径
        NSString *imagePath = [path_document stringByAppendingString:@"/Documents/pic.png"];
        //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
        [UIImagePNGRepresentation(image2) writeToFile:imagePath atomically:YES];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    //    self.navigationController.navigationBar.barTintColor = ssRGBOK;
    //    self.tabBarController.tabBar.hidden = NO;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

@end
