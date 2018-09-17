//
//  GestureScrollView.m
//  WheelSylloge
//
//  Created by 工作 on 2018/9/7.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "GestureScrollView.h"

@interface GestureScrollView()<UIGestureRecognizerDelegate>

@end

@implementation GestureScrollView

/*  是否支持多手势触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥
    是否允许多个手势识别器共同识别，一个控件的手势识别后是否阻断手势识别继续向下传播，默认返回NO；如果为YES，响应者链上层对象触发手势识别后，如果下层对象也添加了手势并成功识别也会继续执行，否则上层对象识别后则不再继续传播 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([self panBack:gestureRecognizer]) {
        return YES;
    }
    return NO;
}

//开始进行手势识别时调用的方法，返回NO则结束识别，不再触发手势，用处：可以在控件指定的位置使用手势识别
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([self panBack:gestureRecognizer]) {
        return NO;
    }
    return YES;
}

//识别侧滑返回手势，防止冲突
- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer
{
    CGFloat edge_x = 0.15 * SCREEN_WIDTH;
    if (gestureRecognizer == self.panGestureRecognizer) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        //translationInView : 手指在视图上移动的位置（x,y）向下和向右为正，向上和向左为负。
        CGPoint point = [pan translationInView:self];
        UIGestureRecognizerState state = gestureRecognizer.state;
        if (UIGestureRecognizerStateBegan == state || UIGestureRecognizerStatePossible == state) {
            //locationInView ： 手指在视图上的位置（x,y）就是手指在视图本身坐标系的位置。
            CGPoint location = [gestureRecognizer locationInView:self];
            if (point.x > 0 && location.x < edge_x && self.contentOffset.x <= 0) {
                return YES;
            }
        }
    }
    return NO;
}

@end
