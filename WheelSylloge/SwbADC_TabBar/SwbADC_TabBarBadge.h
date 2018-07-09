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

@interface SwbADC_TabBarBadge : UIView

/* BadgeValueLb */
@property (nonatomic, strong) UILabel *badgeLabel;

/* 徽章样式 */
@property (nonatomic, assign) SWBBadgeValueType type;

@end
