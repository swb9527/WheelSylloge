//
//  SwbADC_TabBarTool.h
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>



/* badge 动画样式 */
typedef NS_ENUM(NSInteger, SWBTabBarBadgeAnimationType) {
    SWBTabBarBadgeAnimationTypeNone,    //无动画
    SWBTabBarBadgeAnimationTypeShake,   //抖动动画
    SWBTabBarBadgeAnimationTypeOpacity, //透明过度动画
    SWBTabBarBadgeAnimationTypeScale,   //缩放动画
};

@interface SwbADC_TabBarTool : NSObject

/* 单例 */
+ (instancetype)shareTool;

/* TabBar Badge 动画样式 (默认无动画) */
@property (nonatomic, assign) SWBTabBarBadgeAnimationType badgeAnimationType;

@end
