//
//  SwbADC_TabBarItem.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "SwbADC_TabBarItem.h"

@implementation SwbADC_TabBarItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithModel:(SwbADC_ItemConfigModel *)itemModel
{
    self = [super init];
    if (self) {
        [self setItemModel:itemModel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self itemDidLayoutControl];
    [self itemDidLayoutBadgeView];
}

- (void)itemDidLayoutControl
{
    
}
- (void)itemDidLayoutBadgeView
{
    switch (self.itemModel.itemBadgeStyle) {
        case SWBTabBarItemBadgeStyleTopRight:
        {
            //右上
            self.badgeView.center = CGPointMake(self.frame.size.width - (self.badgeView.frame.size.width / 2), self.badgeView.frame.size.height / 2);
        }
            break;
        case SWBTabBarItemBadgeStyleTopCenter:
        {
            //中上
            self.badgeView.center = CGPointMake(self.frame.size.width / 2, self.badgeView.frame.size.height / 2);
        }
            break;
        case SWBTabBarItemBadgeStyleTopLeft:
        {
            //左上
            self.badgeView.center = CGPointMake(self.badgeView.frame.size.width / 2, self.badgeView.frame.size.height / 2);
        }
            break;
            
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
