//
//  SwbADC_TabBarTool.h
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwbADC_TabBarTool : NSObject

/* 单例 */
+ (instancetype)shareTool;

/* tabbar item 显示小圆点 */
- (void)showDotAtIndex:(NSInteger)index;

/* tabbar item显示new */
- (void)showNewAtIndex:(NSInteger)index;

/* tabbar item 显示数字 */
- (void)showBadgeValue:(NSString *)badgeValue AtIndex:(NSInteger)index;

/* 设置tabbar item被选中 */
- (void)setTabBarItemSelectedIndex:(NSInteger)index;

@end
