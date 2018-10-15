//
//  PagerViewConfigration.h
//  WheelSylloge
//
//  Created by 工作 on 2018/8/27.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PagerViewStyle) {
    PagerViewStyleTop,                      //MenuView在顶部
    PagerViewStyleNavigation,               //MenuView在系统导航条
    PagerViewStyleSuspensionRefreshTop,     //MenuView悬浮，刷新控件在HeaderView顶部
    PagerViewStyleSuspensionRefreshCenter,  //MenuView悬浮，刷新控件在HeaderView底部
};



@interface PagerViewConfigration : NSObject

/* 菜单栏位置 默认顶部 */
@property (nonatomic, assign) PagerViewStyle pagerViewStyle;

/* 是否显示遮盖 默认NO */
@property (nonatomic, assign) BOOL showConver;

/* 是否显示指示器线条 默认YES */
@property (nonatomic, assign) BOOL showIndicatorLine;

/* 是否显示底部线条 默认YES */
@property (nonatomic, assign) BOOL showBottomLine;

/* 标题切换颜色是否渐变 默认YES */
@property (nonatomic, assign) BOOL showGradientColor;

/* 是否显示addButton按钮 默认NO */
@property (nonatomic, assign) BOOL showAddButton;

/* 菜单栏是否支持滚动 默认YES */
@property (nonatomic, assign) BOOL scrollMenu;

/* 菜单栏是否支持菜单效果 默认NO */
@property (nonatomic, assign) BOOL bouncesMenu;

/*
 *  是否是居中 (当所有的Item+margin的宽度小于ScrollView宽度)  默认 YES
 *  scrollMenu = NO,aligmentModeCenter = NO 会变成平分
 */
@property (nonatomic, assign) BOOL aligmentModeCenter;

/* 当aligmentModeCenter 变为平分时 是否需要线条宽度等于字体宽度 默认 NO */
@property (nonatomic, assign) BOOL lineWidthEqualTitleWidth;

/* addButton按钮图片 Normal */
@property (nonatomic, strong) NSString *addButtonNormalImageName;

/* addButton按钮图片 Highlighted */
@property (nonatomic, strong) NSString *addButtonHighlightedImageName;

/* addButton按钮背景颜色 */
@property (nonatomic, strong) UIColor *addButtonBackgroundColor;

/* 指示器线条颜色 */
@property (nonatomic, strong) UIColor *indicatorLineColor;

/* 遮盖颜色 */
@property (nonatomic, strong) UIColor *converColor;

/* 菜单栏背景颜色 */
@property (nonatomic, strong) UIColor *pagerViewBackgroundColor;

/* 选项标题颜色 Normal */
@property (nonatomic, strong) UIColor *itemTitleNormalColor;

/* 选项标题颜色 Selected */
@property (nonatomic, strong) UIColor *itemTitleSelectedColor;

/* 底部线条颜色 */
@property (nonatomic, strong) UIColor *bottomLineColor;

/* 底部线条左右偏移量 默认0 */
@property (nonatomic, assign) CGFloat bottomLineLeftAndRightMargin;

/* 底部线条圆角 */
@property (nonatomic, assign) CGFloat bottomLineCornerRadius;

/* 指示器线条的高度 默认2 */
@property (nonatomic, assign) CGFloat indicatorLineHeight;

/* 指示器线条距底部距离 默认0 */
@property (nonatomic, assign) CGFloat indicatorLineBottomMargin;

/* 指示器线条圆角 默认0 */
@property (nonatomic, assign) CGFloat indicatorLineCornerRadius;

/* 线条左右增加 0 默认线条宽度是等于item宽度 */
@property (nonatomic, assign) CGFloat indicatorLineLeftAndRightAddWidth;

/* 底部线条高度 默认1 */
@property (nonatomic, assign) CGFloat bottomLineHeight;

/* 遮盖高度 默认28 */
@property (nonatomic, assign) CGFloat converHeight;

/* 菜单栏高度 默认44 */
@property (nonatomic, assign) CGFloat pagerViewHeight;

/* 菜单栏宽度 默认 屏幕宽度 */
@property (nonatomic, assign) CGFloat pagerViewWidth;

/* 遮盖圆角 默认14 */
@property (nonatomic, assign) CGFloat converCornerRadius;

/* 选项相邻间隙 默认0 */
@property (nonatomic, assign) CGFloat itemMargin;

/* 选项左右间隙 默认0 */
@property (nonatomic, assign) CGFloat itemLeftAndRightMargin;

/* 选项字体 默认14 */
@property (nonatomic, strong) UIFont *itemTitleNormalFont;

/* 选项选中字体 */
@property (nonatomic, strong) UIFont *itemTitleSelectedFont;

/* 选项缩放系数 */
@property (nonatomic, assign) CGFloat itemMaxScale;

/* 使下面的初始化方法失效 */
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

+ (instancetype)defaultConfig;


/* 滑动时候颜色渐变 */
@property (nonatomic, assign) CGFloat deltaScale;

@property (nonatomic, assign) CGFloat deltaNorR;

@property (nonatomic, assign) CGFloat deltaNorG;

@property (nonatomic, assign) CGFloat deltaNorB;

@property (nonatomic, assign) CGFloat deltaSelR;

@property (nonatomic, assign) CGFloat deltaSelG;

@property (nonatomic, assign) CGFloat deltaSelB;

- (void)setRGBWithProgress:(CGFloat)progress;

@end
