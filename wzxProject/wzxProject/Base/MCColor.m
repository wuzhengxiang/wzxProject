//
//  MCColor.m
//  MovingCompany
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MCColor.h"

@implementation MCColor

+ (UIColor *)navigationBarBackColor {
    
    return HEXCOLOR(@"#FFFFFF");
}

+ (UIColor *)navigationBarTitleColor {
    
    return HEXCOLOR(@"#ffffff");
}

+ (UIColor *)buttonTitleColor {
    
    return HEXCOLOR(@"#ffffff");
}

+ (UIColor *)titleColor {
    
    return HEXCOLOR(@"#ffffff");
}

+ (UIColor *)midTitleColor  {
    
    return HEXCOLOR(@"#22a977");
}

+ (UIColor *)minTitleColor  {
    
    return HEXCOLOR(@"#000000");
}

+ (UIColor *)infoTitleColor  {
    
    return HEXCOLOR(@"#000000");
}

+ (UIColor *)titleWhiteColor {
    
    return HEXCOLOR(@"#ffffff");
}

+ (UIColor *)titleBlackColor  {
    
    return HEXCOLOR(@"#000000");
}

+ (UIColor *)titleBlueColor {
    
    return HEXCOLOR(@"#22a977");
}

+ (UIColor *)separatelineGrayColor {
    
    return HEXCOLOR(@"#cacbcb");
}

+ (UIColor *)bottomlineGrayColor {
    
    return HEXCOLOR(@"#cacbcb");
}

+ (UIColor *)backWhiteColor {
    
    return HEXCOLOR(@"#fefefe");
}

+ (UIColor *)backGrayColor {
    
    return HEXCOLOR(@"#ffffff");
}

+ (UIColor *)greenColor {
    
    return HEXCOLOR(@"#00AE85");
}

+ (UIColor *)redColor {
    
    return HEXCOLOR(@"#E53252");
}

+ (UIColor *)orangeColor {
    
    return HEXCOLOR(@"#f19149");
}

+ (UIColor *)blackColor {
    
    return HEXCOLOR(@"#000000");
}

+ (UIColor *)grayColor {
    
    return HEXCOLOR(@"#c9caca");
}

+ (UIColor *)whiteColor {
    
    return HEXCOLOR(@"#ffffff");
}

+ (UIColor *)hideViewColor {
    
    UIColor * color = nil;
    color = HEXCOLOR2(@"#000000",0.5);
    return color;
}

+ (UIColor *)backgroundGrayColor {
    
    return HEXCOLOR(@"#efefef");
}

+ (UIColor *)yellowColor {
    
    return HEXCOLOR(@"#ffd905");
}

+(UIColor *)liCangKuColorOne {
    
    return HEXCOLOR(@"#35353504");
}

+(UIColor *)liCangKuColorTwo {
    
    return HEXCOLOR(@"#3D3D3D");
}

+(UIColor *)navgationBlueColorWithColor {
    
    return HEXCOLOR(@"#0198ff");
}

+ (UIImage *)imageWithColor:(UIColor *)color Rect:(CGRect)rect {
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    if (alpha>1)alpha = 1;
    if (alpha<0)alpha = 0;
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)color {
    
    return [self colorWithHexString:color alpha:1];
}

/**
 * 将UIColor变换为UIImage
 *
 **/
+ (UIImage *)createImageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIColor *)deepColorWithColor:(UIColor *)color {
    
    CGFloat R, G, B,A;
    CGColorRef colorRef = [color CGColor];
    size_t numComponents = CGColorGetNumberOfComponents(colorRef);
    
    if (numComponents == 4) {
        
        const CGFloat *components = CGColorGetComponents(colorRef);
        R = components[0];
        G = components[1];
        B = components[2];
        A = components[3];
    }
    return [UIColor colorWithRed:R-0.1 green:G-0.1 blue:B-0.1 alpha:A+0.1];
}

@end
