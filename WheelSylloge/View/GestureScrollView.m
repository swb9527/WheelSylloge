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

/* 识别多个手势 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (<#condition#>) {
        <#statements#>
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    
}

- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer
{
    CGFloat edge_x = 0.15 * SCREEN_WIDTH;
    
}

@end
