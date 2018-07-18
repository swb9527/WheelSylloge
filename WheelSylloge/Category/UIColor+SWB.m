//
//  UIColor+SWB.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/18.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "UIColor+SWB.h"

@implementation UIColor (SWB)

/* 16进制颜色转换 */
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0];
}

/* 16进制颜色转换 带透明度 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]uppercaseString];
    if (cString.length < 6) {
        return UIColor.clearColor;
    }
    //判断前缀
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return UIColor.clearColor;
    }
    
    //从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.length = 2;
    //R
    range.location = 0;
    NSString *rString = [cString substringWithRange:range];
    //G
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //B
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0) green:((float) g / 255.0) blue:((float) b / 255.0) alpha:alpha];
}

@end
