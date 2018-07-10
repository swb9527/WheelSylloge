//
//  SwbADC_TabBar.h
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwbADC_TabBarItem.h"

@class SwbADC_TabBar;

@protocol SwbADC_TabBarDelegate<NSObject>

- (void)swbADC_TabBar:(SwbADC_TabBar *)tabBar didSelectIndex:(NSInteger)index;

@end

@interface SwbADC_TabBar : UIView

/* TabBar背景图 */
@property (nonatomic, strong) UIImageView *backgroundImageView;
/* 当前选中的item下标 */
@property (nonatomic, assign) NSInteger selectedIndex;
/* 当前选中的Item */
@property (nonatomic, strong) SwbADC_TabBarItem *selectedItem;
/* tabBarItems 集合 */
@property (nonatomic, strong, readonly) NSArray <SwbADC_TabBarItem *> *tabBarItems;
/* 是否开启毛玻璃模糊效果 默认NO不开启 */
@property (nonatomic, assign) BOOL translucent;
/* 代理 */
@property (nonatomic, weak) id <SwbADC_TabBarDelegate>delegate;

/* 设置角标 */
- (void)setBadgeValue:(NSString *)badgeValue atIndex:(NSInteger)index;
/* 设置选中的item下标，是否触发设置的动画效果 */
- (void)setSelectIndex:(NSInteger)selectIndex withAnimation:(BOOL)animation;

@end