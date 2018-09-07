//
//  CAAnimation+SWB.h
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (SWB)

/*
 抖动动画
 @param repeatTimes 重复次数
 @return 返回关键帧动画
 */
+ (CAKeyframeAnimation *)shakeAnimationRepeatTimes:(float)repeatTimes;

/*
 透明过渡动画
 @param time 持续时间
 @return 返回透明过度动画
 */
+ (CABasicAnimation *)opacityAnimationDurationTimes:(float)time;

/*
 缩放动画
 */
+ (CABasicAnimation *)scaleAnimation;
+ (CABasicAnimation *)rotationY;
+ (CABasicAnimation *)boundsMin;
+ (CABasicAnimation *)boundsMax;

@end
