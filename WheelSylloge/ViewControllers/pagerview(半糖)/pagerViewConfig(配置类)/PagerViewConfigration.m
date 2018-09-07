//
//  PagerViewConfigration.m
//  WheelSylloge
//
//  Created by 工作 on 2018/8/27.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "PagerViewConfigration.h"

@implementation PagerViewConfigration

#pragma mark- ============ 初始化 ==============
+ (instancetype)swb_initWithPagerViewConfigrationBlock:(void (^)(PagerViewConfigration *))configBlock
{
    PagerViewConfigration *configration = [[PagerViewConfigration alloc]init];
    configBlock(configration);
    return configration;
}

#pragma mark- ============ 子界面设置 ==============
/* 子视图滚动是否有动画效果 */
- (PagerViewConfigration *(^)(BOOL))swb_childScollAnimalEnabled
{
    @WeakObj(self);
    return ^PagerViewConfigration *(BOOL childScollAnimalEnabled) {
        @StrongObj(self);
        self.childScollAnimalEnabled = childScollAnimalEnabled;
        return self;
    };
}

/* 子视图是否支持手势滑动切换界面 */
- (PagerViewConfigration *(^)(BOOL))swb_childScollGestureEnabled
{
    @WeakObj(self);
    return ^PagerViewConfigration *(BOOL childScollGestureEnabled) {
        @StrongObj(self);
        self.childScollGestureEnabled = childScollGestureEnabled;
        return self;
    };
}

#pragma mark- ============ 标题栏设置 ==============
/* 是否启用穿透效果 */
- (PagerViewConfigration *(^)(BOOL))swb_pagerViewPenetrationEnabled
{
    @WeakObj(self);
    return ^PagerViewConfigration *(BOOL pagerViewPenetrationEnabled) {
        @StrongObj(self);
        self.pagerViewPenetrationEnabled = pagerViewPenetrationEnabled;
        return self;
    };
}

/* 标题栏样式 */
- (PagerViewConfigration *(^)(TitleBarStyle))swb_titleBarStyle
{
    @WeakObj(self);
    return ^PagerViewConfigration *(TitleBarStyle titleBarStyle) {
        @StrongObj(self);
        self.titleBarStyle = titleBarStyle;
        return self;
    };
}

/* 标题栏背景颜色 */
- (PagerViewConfigration *(^)(UIColor *))swb_pagerViewBackgroundColor
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIColor *pagerViewBackgroundColor) {
        @StrongObj(self);
        self.pagerViewPenetrationEnabled = pagerViewBackgroundColor;
        return self;
    };
}

/* 标题栏frame */
- (PagerViewConfigration *(^)(CGRect))swb_pagerViewFrame
{
    @WeakObj(self);
    return ^PagerViewConfigration *(CGRect pagerViewFrame) {
        @StrongObj(self);
        self.pagerViewFrame = pagerViewFrame;
        return self;
    };
}

/* 标题栏背景图 */
- (PagerViewConfigration *(^)(UIImage *))swb_pagerViewBackgroundImage
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIImage *pagerViewBackgroundImage) {
        @StrongObj(self);
        self.pagerViewBackgroundImage = pagerViewBackgroundImage;
        return self;
    };
}

#pragma mark- ============ 指示器设置 ==============
/* 指示器的颜色是否和item标题颜色一致 */
- (PagerViewConfigration *(^)(BOOL))swb_indicatorColorEqualTextColorEnabled
{
    @WeakObj(self);
    return ^PagerViewConfigration *(BOOL indicatorColorEqualTextColorEnabled) {
        @StrongObj(self);
        self.indicatorColorEqualTextColorEnabled = indicatorColorEqualTextColorEnabled;
        return self;
    };
}

/* 指示器是否有动画效果 */
- (PagerViewConfigration *(^)(BOOL))swb_indicatorsAnimalsEnabled
{
    @WeakObj(self);
    return ^PagerViewConfigration *(BOOL indicatorsAnimalsEnabled) {
        @StrongObj(self);
        self.indicatorsAnimalsEnabled = indicatorsAnimalsEnabled;
        return self;
    };
}

/* 指示器是否跟随滚动 */
- (PagerViewConfigration *(^)(BOOL))swb_indicatorFollowEnabled
{
    @WeakObj(self);
    return ^PagerViewConfigration *(BOOL indicatorFollowEnabled) {
        @StrongObj(self);
        self.indicatorFollowEnabled = indicatorFollowEnabled;
        return self;
    };
}

/* 指示器样式 */
- (PagerViewConfigration *(^)(IndicatorStyle))swb_indicatorStyle
{
    @WeakObj(self);
    return ^PagerViewConfigration *(IndicatorStyle indicatorStyle) {
        @StrongObj(self);
        self.indicatorStyle = indicatorStyle;
        return self;
    };
}

/* 指示器frame */
- (PagerViewConfigration *(^)(CGRect))swb_indicatorFrame
{
    @WeakObj(self);
    return ^PagerViewConfigration *(CGRect indicatorFrame) {
        @StrongObj(self);
        self.indicatorFrame = indicatorFrame;
        return self;
    };
}

/* 指示器颜色 */
- (PagerViewConfigration *(^)(UIColor *))swb_indicatorColor
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIColor *indicatorColor) {
        @StrongObj(self);
        self.indicatorColor = indicatorColor;
        return self;
    };
}

/* 指示器图片(设置了图片的话,此控件是根据图片本身的大小自适应的) */
- (PagerViewConfigration *(^)(UIImage *))swb_indicatorImage
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIImage *indicatorImage) {
        @StrongObj(self);
        self.indicatorImage = indicatorImage;
        return self;
    };
}

/* 指示器是否隐藏 */
- (PagerViewConfigration *(^)(BOOL))swb_indicatorHidden
{
    @WeakObj(self);
    return ^PagerViewConfigration *(BOOL indicatorHidden) {
        @StrongObj(self);
        self.indicatorHidden = indicatorHidden;
        return self;
    };
}

#pragma mark- ============ item设置 ==============
/* 是否启用滑动颜色渐变 */
- (PagerViewConfigration *(^)(BOOL))swb_itemTextColorGradientEnabled
{
    @WeakObj(self);
    return ^PagerViewConfigration *(BOOL itemTextColorGradientEnabled) {
        @StrongObj(self);
        self.itemTextColorGradientEnabled = itemTextColorGradientEnabled;
        return self;
    };
}

/* 是否显示标题文字 */
- (PagerViewConfigration *(^)(BOOL))swb_itemTextHidden
{
    @WeakObj(self);
    return ^PagerViewConfigration *(BOOL itemTextHidden) {
        @StrongObj(self);
        self.itemTextHidden = itemTextHidden;
        return self;
    };
}

/* 默认选中的item */
- (PagerViewConfigration *(^)(NSInteger))swb_selectedItemSegmentIndex
{
    @WeakObj(self);
    return ^PagerViewConfigration *(NSInteger selectedItemSegmentIndex) {
        @StrongObj(self);
        self.selectedItemSegmentIndex = selectedItemSegmentIndex;
        return self;
    };
}

/* item图片效果 */
- (PagerViewConfigration *(^)(ImageEffectStyle))swb_itemImageEffectStyle
{
    @WeakObj(self);
    return ^PagerViewConfigration *(ImageEffectStyle itemImageEffectStyle) {
        @StrongObj(self);
        self.itemImageEffectStyle = itemImageEffectStyle;
        return self;
    };
}

/* item普通状态下的背景色 */
- (PagerViewConfigration *(^)(UIColor *))swb_normalItemBackgroundColor
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIColor *normalItemBackgroundColor) {
        @StrongObj(self);
        self.normalItemBackgroundColor = normalItemBackgroundColor;
        return self;
    };
}

/* item选中状态下的背景颜色 */
- (PagerViewConfigration *(^)(UIColor *))swb_selectedItemBackgroundColor
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIColor *selectedItemBackgroundColor) {
        @StrongObj(self);
        self.selectedItemBackgroundColor = selectedItemBackgroundColor;
        return self;
    };
}

/* item普通状态下的文字颜色 */
- (PagerViewConfigration *(^)(UIColor *))swb_normalItemTextColor
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIColor *normalItemTextColor) {
        @StrongObj(self);
        self.normalItemTextColor = normalItemTextColor;
        return self;
    };
}

/* item选中状态下的文字颜色 */
- (PagerViewConfigration *(^)(UIColor *))swb_selectedItemTextColor
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIColor *selectedItemTextColor) {
        @StrongObj(self);
        self.selectedItemTextColor = selectedItemTextColor;
        return self;
    };
}

/* item文字font */
- (PagerViewConfigration *(^)(UIFont *))swb_itemTextFont
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIFont *itemTextFont) {
        @StrongObj(self);
        self.itemTextFont = itemTextFont;
        return self;
    };
}

/* item普通状态下的图片 */
- (PagerViewConfigration *(^)(UIImage *))swb_normalItemImage
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIImage *normalItemImage) {
        @StrongObj(self);
        self.normalItemImage = normalItemImage;
        return self;
    };
}

/* item选中状态下的图片 */
- (PagerViewConfigration *(^)(UIImage *))swb_selectedItemImage
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIImage *selectedItemImage) {
        @StrongObj(self);
        self.selectedItemImage = selectedItemImage;
        return self;
    };
}

/* item普通状态下的图片数组 */
- (PagerViewConfigration *(^)(NSArray *))swb_normalItemImageArray
{
    @WeakObj(self);
    return ^PagerViewConfigration *(NSArray *normalItemImageArray) {
        @StrongObj(self);
        self.normalItemImageArray = normalItemImageArray;
        return self;
    };
}

/* item选中状态下的图片数组 */
- (PagerViewConfigration *(^)(NSArray *))swb_selectedItemImageArray
{
    @WeakObj(self);
    return ^PagerViewConfigration *(NSArray *selectedItemImageArray) {
        @StrongObj(self);
        self.selectedItemImageArray = selectedItemImageArray;
        return self;
    };
}

/* item普通状态下的背景图片 */
- (PagerViewConfigration *(^)(UIImage *))swb_normalItemBackgroundImage
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIImage *normalItemBackgroundImage) {
        @StrongObj(self);
        self.normalItemBackgroundImage = normalItemBackgroundImage;
        return self;
    };
}

/* item选中状态下的背景图片 */
- (PagerViewConfigration *(^)(UIImage *))swb_selectedItemBackgroundImage
{
    @WeakObj(self);
    return ^PagerViewConfigration *(UIImage *selectedItemBackgroundImage) {
        @StrongObj(self);
        self.selectedItemBackgroundImage = selectedItemBackgroundImage;
        return self;
    };
}

/* item普通状态下的背景图片数组 */
- (PagerViewConfigration *(^)(NSArray *))swb_normalItemBackgroundImageArray
{
    @WeakObj(self);
    return ^PagerViewConfigration *(NSArray *normalItemBackgroundImageArray) {
        @StrongObj(self);
        self.normalItemBackgroundImageArray = normalItemBackgroundImageArray;
        return self;
    };
}

/* item选中状态下的背景图片数组 */
- (PagerViewConfigration *(^)(NSArray *))swb_selectedItemBackgroundImageArray
{
    @WeakObj(self);
    return ^PagerViewConfigration *(NSArray *selectedItemBackgroundImageArray) {
        @StrongObj(self);
        self.selectedItemBackgroundImageArray = selectedItemBackgroundImageArray;
        return self;
    };
}

/* item的图片大小(不能设置背景图片) */
- (PagerViewConfigration *(^)(CGSize))swb_itemImageSize
{
    @WeakObj(self);
    return ^PagerViewConfigration *(CGSize itemImageSize) {
        @StrongObj(self);
        self.itemImageSize = itemImageSize;
        return self;
    };
}

/* item普通状态下文字颜色数组(每个item的颜色不同) */
- (PagerViewConfigration *(^)(NSArray *))swb_normalItemTextColorArray
{
    @WeakObj(self);
    return ^PagerViewConfigration *(NSArray *normalItemTextColorArray) {
        @StrongObj(self);
        self.normalItemTextColorArray = normalItemTextColorArray;
        return self;
    };
}

/* item选中状态下文字颜色数组(每个item的颜色不同) */
- (PagerViewConfigration *(^)(NSArray *))swb_selectedItemTextColorArray
{
    @WeakObj(self);
    return ^PagerViewConfigration *(NSArray *selectedItemTextColorArray) {
        @StrongObj(self);
        self.selectedItemTextColorArray = selectedItemTextColorArray;
        return self;
    };
}

@end
