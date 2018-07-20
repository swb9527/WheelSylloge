//
//  UIFont+SWB.h
//  WheelSylloge
//
//  Created by 工作 on 2018/7/20.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (SWB)

#pragma mark- ============ 平方字体 ==============
/*
 PingFang SC PingFangSC-Ultralight
 PingFang SC PingFangSC-Regular
 PingFang SC PingFangSC-Semibold
 PingFang SC PingFangSC-Thin
 PingFang SC PingFangSC-Light
 PingFang SC PingFangSC-Medium
 */
+ (UIFont *)mediumFontOfSize:(CGFloat)fontSize;
+ (UIFont *)regularFontOfSize:(CGFloat)fontSize;
+ (UIFont *)lightFontOfSize:(CGFloat)fontSize;

@end
