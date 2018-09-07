//
//  RefreshToolUtil.h
//  WheelSylloge
//
//  Created by 工作 on 2018/8/14.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RefreshHeaderType) {
    RefreshHeaderTypeNormal,
    RefreshHeaderTypeGif,
    RefreshHeaderTypeDIY,
};

typedef NS_ENUM(NSInteger, RefreshFooterType) {
    RefreshFooterTypeAutoNormal,
    RefreshFooterTypeAutoGif,
    RefreshFooterTypeBackNormal,
    RefreshFooterTypeBackGif,
    RefreshFooterTypeAutoDIY,
    RefreshFooterTypeBackDIY,
};

@interface RefreshToolUtil : NSObject

@property (nonatomic, strong) UITableView *refreshTableView;

#pragma mark- ============ 下拉刷新 ==============
/* 设置普通状态的动画图片 */
@property (nonatomic, strong) NSArray *idleImages;
/* 设置即将刷新状态的动画图片（一松开就会刷新的状态） */
@property (nonatomic, strong) NSArray *pullingImages;
/* 设置正在刷新状态的动画图片 */
@property (nonatomic, strong) NSArray *refreshingImages;
/* 下拉刷新隐藏时间 */
@property (nonatomic, assign) BOOL hideLastUpdatedTime;
/* 下拉刷新隐藏状态 */
@property (nonatomic, assign) BOOL hideStatus;
/* 设置普通状态的文字 */
@property (nonatomic, strong) NSString *idleText;
/* 设置即将刷新状态的文字 （一松开就会刷新的状态）*/
@property (nonatomic, strong) NSString *pullingText;
/* 设置正在刷新的文字 */
@property (nonatomic, strong) NSString *refreshingText;

/* 设置字体大小 */
@property (nonatomic, strong) UIFont *lastUpdatedTimeFont;
@property (nonatomic, strong) UIFont *statusFont;

/* 设置字体颜色 */
@property (nonatomic, strong) UIColor *lastUpdateTimeTextColor;
@property (nonatomic, strong) UIColor *statusTextColor;

/* refreshHeader样式 */
@property (nonatomic, assign) RefreshHeaderType headerType;

#pragma mark- ============ 上拉加载 ==============
/* 设置普通状态加载图片动画 */
@property (nonatomic, strong) NSArray *idleLoadImages;
/* 设置即将加载状态的动画图片 */
@property (nonatomic, strong) NSArray *pullingLoadImages;
/* 设置正在加载状态的动画图片 */
@property (nonatomic, strong) NSArray *loadingImages;
/* 上拉加载隐藏状态 */
@property (nonatomic, assign) BOOL hideLoadStatus;
/* 设置普通状态的文字 */
@property (nonatomic, strong) NSString *idleLoadText;
/* 设置即将刷新状态的文字 （一松开就会刷新的状态）*/
@property (nonatomic, strong) NSString *loadPullingText;
/* 设置正在加载状态的文字 */
@property (nonatomic, strong) NSString *loadingText;
/* 设置没有数据状态的文字 */
@property (nonatomic, strong) NSString *noMoreDataText;
/* 设置字体 */
@property (nonatomic, strong) UIFont *loadFont;
/* 设置颜色 */
@property (nonatomic, strong) UIColor *loadTextColor;

/* refreshFooter样式 */
@property (nonatomic, assign) RefreshFooterType footerType;

- (instancetype)initWithTableView:(UITableView *)refreshTb;

/* 下拉刷新 */
- (void)dropDownRefresh:(void(^)(void))dropDownBlock;
/* 上拉加载 */
- (void)dropUpRefresh:(void(^)(void))dropUpBlock;
/* 数据加载完成，没有更多数据 */
- (void)endRefreshingWithNoMoreData;
/* 重置没有更多数据状态 */
- (void)resetNoMoreData;

@end
