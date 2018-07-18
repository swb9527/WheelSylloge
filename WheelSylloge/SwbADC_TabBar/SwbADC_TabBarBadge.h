//
//  SwbADC_TabBarBadge.h
//  WheelSylloge
//
//  Created by 工作 on 2018/7/9.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SWBBadgeValueType) {
    SWBBadgeValueTypeDot, //小红点
    SWBBadgeValueTypeNew, //new
    SWBBadgeValueTypeNumber, //number
};

/* badge 动画样式 */
typedef NS_ENUM(NSInteger, SWBTabBarBadgeAnimationType) {
    SWBTabBarBadgeAnimationTypeNone,    //无动画
    SWBTabBarBadgeAnimationTypeShake,   //抖动动画
    SWBTabBarBadgeAnimationTypeOpacity, //透明过度动画
    SWBTabBarBadgeAnimationTypeScale,   //缩放动画
};

@interface SwbADC_TabBarBadge : UIView

/* BadgeValueLb */
@property (nonatomic, strong) UILabel *badgeLabel;

/* badgeText */
@property (nonatomic, strong) NSString *badgeText;

/* 徽章样式 */
@property (nonatomic, assign) SWBBadgeValueType type;

/* TabBar Badge 动画样式 (默认无动画) */
@property (nonatomic, assign) SWBTabBarBadgeAnimationType badgeAnimationType;

/* 为零是否自动隐藏 默认不隐藏 */
@property(nonatomic, assign)BOOL automaticHidden;

@end
