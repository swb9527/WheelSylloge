//
//  UIColor+SWB.h
//  WheelSylloge
//
//  Created by 工作 on 2018/7/18.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SWB)

/* 16进制颜色转换 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/* 16进制颜色转换 带透明度 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
