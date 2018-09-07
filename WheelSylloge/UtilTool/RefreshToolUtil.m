//
//  RefreshToolUtil.m
//  WheelSylloge
//
//  Created by 工作 on 2018/8/14.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "RefreshToolUtil.h"
#import <MJRefresh/MJRefresh.h>

@interface RefreshToolUtil()

@property (nonatomic, copy) void (^DropDownRefreshBlock)(void);
@property (nonatomic, copy) void (^DropUpRefreshBlock)(void);

@end

@implementation RefreshToolUtil

- (instancetype)initWithTableView:(UITableView *)refreshTb
{
    self = [super init];
    if (self) {
        self.refreshTableView = refreshTb;
        [self configuration];
    }
    return self;
}

/* 初始化设置 */
- (void)configuration
{
    self.headerType = RefreshHeaderTypeNormal;
    self.footerType = RefreshFooterTypeBackNormal;
    
    // 设置普通状态的动画图片
    NSMutableArray *tempIdleImages = [[NSMutableArray alloc]init];
    for (NSUInteger i = 1; i<=60; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
        [tempIdleImages addObject:image];
    }
    self.idleImages = tempIdleImages.copy;
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *tempRefreshImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [tempRefreshImages addObject:image];
    }
    self.refreshingImages = tempRefreshImages.copy;
    
    self.hideLastUpdatedTime = NO;
    self.hideStatus = NO;
    self.idleText = @"下拉刷新";
    self.pullingText = @"松开立即刷新";
    self.refreshingText = @"正在刷新数据中...";
    
    self.lastUpdatedTimeFont = MJRefreshLabelFont;
    self.lastUpdateTimeTextColor = MJRefreshLabelTextColor;
    
    self.statusFont = MJRefreshLabelFont;
    self.statusTextColor = MJRefreshLabelTextColor;
    
    self.idleLoadImages = self.idleImages;
    self.pullingLoadImages = self.pullingImages;
    self.loadingImages = self.refreshingImages;
    
    self.hideLoadStatus = NO;
    self.idleLoadText = @"上拉加载更多";
    self.loadPullingText = @"松开立即加载";
    self.loadingText = @"加载中...";
    self.noMoreDataText = @"已全部加载完成";
    
    self.loadFont = MJRefreshLabelFont;
    self.loadTextColor = MJRefreshLabelTextColor;
}


/* 下拉刷新 */
- (void)dropDownRefresh:(void(^)(void))dropDownBlock
{
    self.DropDownRefreshBlock = dropDownBlock;
    
    if (self.headerType == RefreshHeaderTypeNormal) {
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownAction)];
        [self configurationRefreshHeader:header];
        self.refreshTableView.mj_header = header;
    }else if (self.headerType == RefreshHeaderTypeGif) {
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownAction)];
        [self configurationRefreshHeader:header];
        self.refreshTableView.mj_header = header;
    }else if (self.headerType == RefreshHeaderTypeDIY) {
        
    }
}
/* 执行下拉刷新block */
- (void)dropDownAction
{
    if (self.DropDownRefreshBlock) {
        self.DropDownRefreshBlock();
        [self.refreshTableView.mj_footer resetNoMoreData];
        [self.refreshTableView.mj_header endRefreshing];
    }
}

/* 上拉加载 */
- (void)dropUpRefresh:(void(^)(void))dropUpBlock
{
    self.DropUpRefreshBlock = dropUpBlock;
    
    if (self.footerType == RefreshFooterTypeBackNormal) {
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(dropUpAction)];
        [self configurationRefreshFooter:footer];
        self.refreshTableView.mj_footer = footer;
    }else if (self.footerType == RefreshFooterTypeBackGif) {
        MJRefreshBackGifFooter *footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(dropUpAction)];
        [self configurationRefreshFooter:footer];
        self.refreshTableView.mj_footer = footer;
    }else if (self.footerType == RefreshFooterTypeAutoNormal) {
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(dropUpAction)];
        [self configurationRefreshFooter:footer];
        self.refreshTableView.mj_footer = footer;
    }else if (self.footerType == RefreshFooterTypeAutoGif) {
        MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(dropUpAction)];
        [self configurationRefreshFooter:footer];
        self.refreshTableView.mj_footer = footer;
    }
}
/* 执行上拉刷新block */
- (void)dropUpAction
{
    if (self.DropUpRefreshBlock) {
        self.DropUpRefreshBlock();
    }
}


/* 数据加载完成，没有更多数据 */
- (void)endRefreshingWithNoMoreData
{
    [self.refreshTableView.mj_footer endRefreshingWithNoMoreData];
}


/* 重置没有更多数据状态 */
- (void)resetNoMoreData
{
    [self.refreshTableView.mj_footer resetNoMoreData];
}

/* 配置各种refreshHeader的属性 */
- (void)configurationRefreshHeader:(MJRefreshStateHeader *)header
{
    header.lastUpdatedTimeLabel.hidden = self.hideLastUpdatedTime;
    header.stateLabel.hidden = self.hideStatus;
    [header setTitle:self.idleText forState:MJRefreshStateIdle];
    [header setTitle:self.pullingText forState:MJRefreshStatePulling];
    [header setTitle:self.refreshingText forState:MJRefreshStateRefreshing];
    header.stateLabel.font = self.statusFont;
    header.lastUpdatedTimeLabel.font = self.lastUpdatedTimeFont;
    header.stateLabel.textColor = self.statusTextColor;
    header.lastUpdatedTimeLabel.textColor = self.lastUpdateTimeTextColor;
    if ([header isKindOfClass:[MJRefreshGifHeader class]]) {
        MJRefreshGifHeader *gifHeader = (MJRefreshGifHeader *)header;
        [gifHeader setImages:self.idleImages forState:MJRefreshStateIdle];
        [gifHeader setImages:self.pullingImages forState:MJRefreshStatePulling];
        [gifHeader setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    }
}

- (void)configurationRefreshFooter:(MJRefreshFooter *)footer
{
    if ([footer isKindOfClass:[MJRefreshAutoStateFooter class]]) {
        MJRefreshAutoStateFooter *autoFooter = (MJRefreshAutoStateFooter *)footer;
        autoFooter.stateLabel.hidden = self.hideLoadStatus;
        [autoFooter setTitle:self.idleLoadText forState:MJRefreshStateIdle];
        [autoFooter setTitle:self.loadPullingText forState:MJRefreshStatePulling];
        [autoFooter setTitle:self.loadingText forState:MJRefreshStateRefreshing];
        [autoFooter setTitle:self.noMoreDataText forState:MJRefreshStateNoMoreData];
        autoFooter.stateLabel.font = self.loadFont;
        autoFooter.stateLabel.textColor = self.loadTextColor;
        if ([footer isKindOfClass:[MJRefreshAutoGifFooter class]]) {
            MJRefreshAutoGifFooter *autoGifFooter = (MJRefreshAutoGifFooter *)footer;
            [autoGifFooter setImages:self.idleLoadImages forState:MJRefreshStateIdle];
            [autoGifFooter setImages:self.pullingLoadImages forState:MJRefreshStatePulling];
            [autoGifFooter setImages:self.loadingImages forState:MJRefreshStateRefreshing];
        }
    }else if ([footer isKindOfClass:[MJRefreshBackStateFooter class]]) {
        MJRefreshBackStateFooter *backFooter = (MJRefreshBackStateFooter *)footer;
        backFooter.stateLabel.hidden = self.hideLoadStatus;
        [backFooter setTitle:self.idleLoadText forState:MJRefreshStateIdle];
        [backFooter setTitle:self.loadPullingText forState:MJRefreshStatePulling];
        [backFooter setTitle:self.loadingText forState:MJRefreshStateRefreshing];
        [backFooter setTitle:self.noMoreDataText forState:MJRefreshStateNoMoreData];
        backFooter.stateLabel.font = self.loadFont;
        backFooter.stateLabel.textColor = self.loadTextColor;
        if ([footer isKindOfClass:[MJRefreshBackGifFooter class]]) {
            MJRefreshBackGifFooter *backGifFooter = (MJRefreshBackGifFooter *)footer;
            [backGifFooter setImages:self.idleLoadImages forState:MJRefreshStateIdle];
            [backGifFooter setImages:self.pullingLoadImages forState:MJRefreshStatePulling];
            [backGifFooter setImages:self.loadingImages forState:MJRefreshStateRefreshing];
        }
    }
}

@end
