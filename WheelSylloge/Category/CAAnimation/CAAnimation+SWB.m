//
//  CAAnimation+SWB.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

/*
 #define angle2Radian(angle) ((angle)/180.0*M_PI)
 
 transform.rotation.x 围绕x轴翻转 参数：角度 angle2Radian(4)
 
 transform.rotation.y 围绕y轴翻转 参数：同上
 
 transform.rotation.z 围绕z轴翻转 参数：同上
 
 transform.rotation 默认围绕z轴
 
 transform.scale.x x方向缩放 参数：缩放比例 1.5
 
 transform.scale.y y方向缩放 参数：同上
 
 transform.scale.z z方向缩放 参数：同上
 
 transform.scale 所有方向缩放 参数：同上
 
 transform.translation.x x方向移动 参数：x轴上的坐标 100
 
 transform.translation.y x方向移动 参数：y轴上的坐标
 
 transform.translation.z x方向移动 参数：z轴上的坐标
 
 transform.translation 移动 参数：移动到的点 （100，100）
 
 opacity 透明度 参数：透明度 0.5
 
 backgroundColor 背景颜色 参数：颜色 (id)[[UIColor redColor] CGColor]
 
 cornerRadius 圆角 参数：圆角半径 5
 
 borderWidth 边框宽度 参数：边框宽度 5
 
 bounds 大小 参数：CGRect
 
 contents 内容 参数：CGImage
 
 contentsRect 可视内容 参数：CGRect 值是0～1之间的小数
 
 hidden 是否隐藏
 
 position
 
 shadowColor
 
 shadowOffset
 
 shadowOpacity
 
 shadowRadius
 */

#import "CAAnimation+SWB.h"
#import <UIKit/UIKit.h>

#define angle2Radian(angle) ((angle)/180.0*M_PI)

@implementation CAAnimation (SWB)

+ (CAKeyframeAnimation *)shakeAnimationRepeatTimes:(float)repeatTimes
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    animation.values = @[@(angle2Radian(-15)),@(angle2Radian(-10)),@(angle2Radian(-7)),@(angle2Radian(-5)),@(angle2Radian(0)),@(angle2Radian(5)),@(angle2Radian(7)),@(angle2Radian(10)),@(angle2Radian(15))];
    animation.repeatCount = repeatTimes;
    return animation;
}

+ (CABasicAnimation *)opacityAnimationDurationTimes:(float)time
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:0.3];
    animation.repeatCount = 3;  //重复的次数，不停重复设置为HUGE_VALF
    animation.duration = time;  //动画的时间
//    animation.beginTime = CACurrentMediaTime()+2; //指定动画开始的时间，从开始延迟几秒的话设置为CACurrentMediaTime()+秒数
//    animation.timingFunction = ;  //设置动画的速度变化
    animation.autoreverses = YES;   //动画结束时是否执行逆动画
    return animation;
}

+ (CABasicAnimation *)scaleAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = [NSNumber numberWithFloat:1.2];
    animation.duration = 0.3;
    animation.repeatCount = 3;
    animation.autoreverses = YES;
    return animation;
}

+ (CABasicAnimation *)rotationY
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.toValue = [NSNumber numberWithFloat:M_PI * 2];
    return animation;
}

+ (CABasicAnimation *)boundsMin
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(12, 12)];
    return animation;
}

+ (CABasicAnimation *)boundsMax
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(40, 40)];
    return animation;
}

@end
