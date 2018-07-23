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

#pragma mark- ============ HelveticaNeue字体 ==============
//等宽字体一般用于倒计时
/*
 Helvetica NEUE HelveticaNeue-UltraLightItalic
 Helvetica NEUE HelveticaNeue-Medium
 Helvetica NEUE HelveticaNeue-MediumItalic
 Helvetica NEUE HelveticaNeue-UltraLight
 Helvetica NEUE HelveticaNeue-Italic
 Helvetica NEUE HelveticaNeue-Light
 Helvetica NEUE HelveticaNeue-ThinItalic
 Helvetica NEUE HelveticaNeue-Bold
 Helvetica NEUE HelveticaNeue-Thin
 Helvetica NEUE HelveticaNeue
 Helvetica NEUE HelveticaNeue-BoldItalic
 */
+ (UIFont *)helveticaNeueMediumFontOfSize:(CGFloat)fontSize;
+ (UIFont *)helveticaNeueRegularFontOfSize:(CGFloat)fontSize;
+ (UIFont *)helveticaNeueLightFontOfSize:(CGFloat)fontSize;
@end
