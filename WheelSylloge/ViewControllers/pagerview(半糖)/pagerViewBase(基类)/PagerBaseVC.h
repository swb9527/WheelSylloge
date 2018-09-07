//
//  PagerBaseVC.h
//  WheelSylloge
//
//  Created by 工作 on 2018/8/24.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "BaseViewController.h"
#import "PagerViewConfigration.h"
#import "PagerViewSegment.h"

@class PagerBaseVC;

@protocol PagerBaseViewControllerDelegate<NSObject>

@optional //不是必须实现的
/**
 列表滚动时回调
 
 @param contentOffsetY 列表偏移量
 @param progress 进度
 */
- (void)pageViewController:(PagerBaseVC *)pageViewController contentOffsetY:(CGFloat)contentOffsetY progress:(CGFloat)progress;

- (void)pageViewController:(PagerBaseVC *)pageViewController didEndDecelerating:(UIScrollView *)scrollView;



@end

@protocol PagerBaseViewControllerDataSource <NSObject>
@required

- (UIScrollView *)pageViewController:(PagerBaseVC *)pageViewController pageForIndex:(NSInteger)index;

@end

@interface PagerBaseVC : BaseViewController

/* 配置信息 */
@property (nonatomic, strong) PagerViewConfigration *config;
/* 控制器数组 */
@property (nonatomic, strong) NSMutableArray *vcArr;
/* 菜单栏 */
@property (nonatomic, strong) PagerViewSegment *segment;
/* 头部HeaderView */
@property (nonatomic, strong) UIView *headerView;
/* 数据源 */
@property (nonatomic, weak) id<PagerBaseViewControllerDataSource> datasource;
/* 代理 */
@property (nonatomic, weak) id<PagerBaseViewControllerDelegate> delegate;
/* 当前页面Index */
@property (nonatomic, assign) NSInteger currentIndex;
/* 头部伸缩背景view */
@property (nonatomic, strong) UIView *scaleBackgroundView;

/* 以下初始化方法失效 */
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

/**
 初始化方法
 
 @param controllers 子控制器数组
 @param titles 菜单栏标题
 @param config 配置信息
 */
+ (instancetype)pageViewControllerWithControllers:(NSArray *)controllers titles:(NSArray *)titles config:(PagerViewConfigration *)config;

/**
 当前PageViewController作为子控制器
 
 @param parentViewController 父控制器
 */
- (void)addSelfToParentViewController:(UIViewController *)parentViewController;

/* 从父类控制器中移除自己 */
- (void)removeSelfViewController;

/**
 选中页码
 
 @param pageIndex 页面下标
 */
- (void)setSelectedPageIndex:(NSInteger)pageIndex;

@end
