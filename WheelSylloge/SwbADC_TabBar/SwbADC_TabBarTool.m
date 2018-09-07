//
//  SwbADC_TabBarTool.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "SwbADC_TabBarTool.h"
#import "SwbADC_ViewController.h"

@implementation SwbADC_TabBarTool

static id _instance = nil;

+ (instancetype)shareTool
{
    return [[self alloc]init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (instancetype)init
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}

/* tabbar item 显示小圆点 */
- (void)showDotAtIndex:(NSInteger)index
{
    SwbADC_TabBarItem *tabBarItem = [self getTabBarItemAtIndex:index];
    tabBarItem.badgeView.hidden = NO;
    tabBarItem.badgeView.type = SWBBadgeValueTypeDot;
}

/* tabbar item显示new */
- (void)showNewAtIndex:(NSInteger)index
{
    SwbADC_TabBarItem *tabBarItem = [self getTabBarItemAtIndex:index];
    tabBarItem.badgeView.hidden = NO;
    tabBarItem.badgeView.type = SWBBadgeValueTypeNew;
}

/* tabbar item 显示数字 */
- (void)showBadgeValue:(NSString *)badgeValue AtIndex:(NSInteger)index
{
    SwbADC_TabBarItem *tabBarItem = [self getTabBarItemAtIndex:index];
    tabBarItem.badgeView.hidden = NO;
    tabBarItem.badgeView.badgeText = badgeValue;
    tabBarItem.badgeView.type = SWBBadgeValueTypeNumber;
}

/* 设置tabbar item被选中 */
- (void)setTabBarItemSelectedIndex:(NSInteger)index
{
    if (index >= [self swbADC_TabBar].tabBarItems.count) {
        return;
    }
    [self rootTabBarVC].selectedIndex = index;
    [self swbADC_TabBar].selectedIndex = index;
}

/* 根控制器 */
- (SwbADC_ViewController *)rootTabBarVC
{
    return (SwbADC_ViewController *)appDelegate.window.rootViewController;
}

/* tabbar */
- (SwbADC_TabBar *)swbADC_TabBar
{
    return [self rootTabBarVC].swbTabBar;
}

/* 获取index对应的item */
- (SwbADC_TabBarItem *)getTabBarItemAtIndex:(NSInteger)index
{
    if (index >= [self swbADC_TabBar].tabBarItems.count) {
        return nil;
    }
    return [self swbADC_TabBar].tabBarItems[index];
}

@end
