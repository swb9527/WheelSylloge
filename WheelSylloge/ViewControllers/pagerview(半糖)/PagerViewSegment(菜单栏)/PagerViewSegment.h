//
//  PagerViewSegment.h
//  WheelSylloge
//
//  Created by 工作 on 2018/8/27.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestureScrollView.h"

@class PagerViewConfigration;

@protocol PagerViewSegmentDelegate<NSObject>

@optional

/* 点击item */
- (void)pagerViewSegmentItemClicked:(UILabel *)label index:(NSInteger)index;

/* 点击add按钮 */
- (void)pagerViewSegmentAddButtonClicked:(UIButton *)button;

@end

@interface PagerViewSegment : GestureScrollView

/* 使以下初始化方法失效 */
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

+ (instancetype)pagerViewSegmentWithFrame:(CGRect)frame titles:(NSArray *)titles configration:(PagerViewConfigration *)configration delegate:(id<PagerViewSegmentDelegate>)delegate defaultIndex:(NSInteger)defaultIndex;

- (void)adjustItemPositionWithCurrentIndex:(NSInteger)index;

- (void)adjustItemWithProgress:(CGFloat)progress lastIndex:(NSInteger)lastIndex currentIndex:(NSInteger)currentIndex;

- (void)selectedItemIndex:(NSInteger)index animated:(BOOL)animated;

- (void)adjustIntemWithAnimated:(BOOL)animated;

@end
