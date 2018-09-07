//
//  PagerViewConfigration.h
//  WheelSylloge
//
//  Created by 工作 on 2018/8/27.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 标题样式 */
typedef NS_OPTIONS(NSUInteger, TitleBarStyle) {
    TitleBarStyleClassic,   /* 经典标题栏样式 */
    TitleBarStyleScroll,    /* 滚动标题栏样式 */
};

/* 底部指示器样式 */
typedef NS_OPTIONS(NSUInteger, IndicatorStyle) {
    IndicatorStyleItem,         /* 指示器宽度与item一样 */
    IndicatorStyleItemTitle,    /* 指示器与item文字宽度一样的样式 */
};

/* 按钮图片样式 */
typedef NS_OPTIONS(NSUInteger, ImageEffectStyle) {
    ImageEffectStyleClassic,    /* 图片左，文字右 */
    ImageEffectStyleUpDown,     /* 图片上，文字下 */
    ImageEffectStyleCenter,     /* 图片文字都在中间 */
};


@interface PagerViewConfigration : NSObject

/* 初始化 */
+ (instancetype)swb_initWithPagerViewConfigrationBlock:(void(^)(PagerViewConfigration *config))configBlock;

#pragma mark- ============ 子界面设置 ==============
/* 子视图滚动是否有动画效果 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_childScollAnimalEnabled)(BOOL childScollAnimalEnabled);
@property (nonatomic, assign) BOOL childScollAnimalEnabled;

/* 子视图是否支持手势滑动切换界面 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_childScollGestureEnabled)(BOOL childScollGestureEnabled);
@property (nonatomic, assign) BOOL childScollGestureEnabled;

#pragma mark- ============ 标题栏设置 ==============
/* 是否启用穿透效果 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_pagerViewPenetrationEnabled)(BOOL pagerViewPenetrationEnabled);
@property (nonatomic, assign) BOOL pagerViewPenetrationEnabled;

/* 标题栏样式 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_titleBarStyle)(TitleBarStyle titleBarStyle);
@property (nonatomic, assign) TitleBarStyle titleBarStyle;

/* 标题栏背景颜色 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_pagerViewBackgroundColor)(UIColor *pagerViewBackgroundColor);
@property (nonatomic, strong) UIColor *pagerViewBackgroundColor;

/* 标题栏frame */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_pagerViewFrame)(CGRect pagerViewFrame);
@property (nonatomic, assign) CGRect pagerViewFrame;

/* 标题栏背景图 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_pagerViewBackgroundImage)(UIImage *pagerViewBackgroundImage);
@property (nonatomic, strong) UIImage *pagerViewBackgroundImage;

#pragma mark- ============ 指示器设置 ==============
/* 指示器的颜色是否和item标题颜色一致 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_indicatorColorEqualTextColorEnabled)(BOOL indicatorColorEqualTextColorEnabled);
@property (nonatomic, assign) BOOL indicatorColorEqualTextColorEnabled;

/* 指示器是否有动画效果 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_indicatorsAnimalsEnabled)(BOOL indicatorsAnimalsEnabled);
@property (nonatomic, assign) BOOL indicatorsAnimalsEnabled;

/* 指示器是否跟随滚动 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_indicatorFollowEnabled)(BOOL indicatorFollowEnabled);
@property (nonatomic, assign) BOOL indicatorFollowEnabled;

/* 指示器样式 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_indicatorStyle)(IndicatorStyle indicatorStyle);
@property (nonatomic, assign) IndicatorStyle indicatorStyle;

/* 指示器frame */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_indicatorFrame)(CGRect indicatorFrame);
@property (nonatomic, assign) CGRect indicatorFrame;

/* 指示器颜色 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_indicatorColor)(UIColor *indicatorColor);
@property (nonatomic, strong) UIColor *indicatorColor;

/* 指示器图片(设置了图片的话,此控件是根据图片本身的大小自适应的) */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_indicatorImage)(UIImage *indicatorImage);
@property (nonatomic, strong) UIImage *indicatorImage;

/* 指示器是否隐藏 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_indicatorHidden)(BOOL indicatorHidden);
@property (nonatomic, assign) BOOL indicatorHidden;

#pragma mark- ============ item设置 ==============
/* 是否启用滑动颜色渐变 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_itemTextColorGradientEnabled)(BOOL itemTextColorGradientEnabled);
@property (nonatomic, assign) BOOL itemTextColorGradientEnabled;

/* 是否显示标题文字 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_itemTextHidden)(BOOL itemTextHidden);
@property (nonatomic, assign) BOOL itemTextHidden;

/* 默认选中的item */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_selectedItemSegmentIndex)(NSInteger selectedItemSegmentIndex);
@property (nonatomic, assign) NSInteger selectedItemSegmentIndex;

/* item图片效果 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_itemImageEffectStyle)(ImageEffectStyle itemImageEffectStyle);
@property (nonatomic, assign) ImageEffectStyle itemImageEffectStyle;

/* item普通状态下的背景色 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_normalItemBackgroundColor)(UIColor *normalItemBackgroundColor);
@property (nonatomic, strong) UIColor *normalItemBackgroundColor;

/* item选中状态下的背景颜色 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_selectedItemBackgroundColor)(UIColor *selectedItemBackgroundColor);
@property (nonatomic, strong) UIColor *selectedItemBackgroundColor;

/* item普通状态下的文字颜色 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_normalItemTextColor)(UIColor *normalItemTextColor);
@property (nonatomic, strong) UIColor *normalItemTextColor;

/* item选中状态下的文字颜色 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_selectedItemTextColor)(UIColor *selectedItemTextColor);
@property (nonatomic, strong) UIColor *selectedItemTextColor;

/* item文字font */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_itemTextFont)(UIFont *itemTextFont);
@property (nonatomic, strong) UIFont *itemTextFont;

/* item普通状态下的图片 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_normalItemImage)(UIImage *normalItemImage);
@property (nonatomic, strong) UIImage *normalItemImage;

/* item选中状态下的图片 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_selectedItemImage)(UIImage *selectedItemImage);
@property (nonatomic, strong) UIImage *selectedItemImage;

/* item普通状态下的图片数组 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_normalItemImageArray)(NSArray *normalItemImageArray);
@property (nonatomic, strong) NSArray *normalItemImageArray;

/* item选中状态下的图片数组 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_selectedItemImageArray)(NSArray *selectedItemImageArray);
@property (nonatomic, strong) NSArray *selectedItemImageArray;

/* item普通状态下的背景图片 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_normalItemBackgroundImage)(UIImage *normalItemBackgroundImage);
@property (nonatomic, strong) UIImage *normalItemBackgroundImage;

/* item选中状态下的背景图片 */
@property (nonatomic, strong) PagerViewConfigration *(^swb_selectedItemBackgroundImage)(UIImage *selectedItemBackgroundImage);
@property (nonatomic, strong) UIImage *selectedItemBackgroundImage;

/* item普通状态下的背景图片数组 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_normalItemBackgroundImageArray)(NSArray *normalItemBackgroundImageArray);
@property (nonatomic, strong) NSArray *normalItemBackgroundImageArray;

/* item选中状态下的背景图片数组 */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_selectedItemBackgroundImageArray)(NSArray *selectedItemBackgroundImageArray);
@property (nonatomic, strong) NSArray *selectedItemBackgroundImageArray;

/* item的图片大小(不能设置背景图片) */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_itemImageSize)(CGSize itemImageSize);
@property (nonatomic, assign) CGSize itemImageSize;

/* item普通状态下文字颜色数组(每个item的颜色不同) */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_normalItemTextColorArray)(NSArray *normalItemTextColorArray);
@property (nonatomic, strong) NSArray *normalItemTextColorArray;

/* item选中状态下文字颜色数组(每个item的颜色不同) */
@property (nonatomic, copy, readonly) PagerViewConfigration *(^swb_selectedItemTextColorArray)(NSArray *selectedItemTextColorArray);
@property (nonatomic, strong) NSArray *selectedItemTextColorArray;

@end
