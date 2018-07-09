//
//  SwbADC_TabBarBadge.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/9.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "SwbADC_TabBarBadge.h"
#import "UIView+SWB.h"

@implementation SwbADC_TabBarBadge

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.badgeLabel.textColor = UIColor.whiteColor;
        self.badgeLabel.font = [UIFont systemFontOfSize:11.f];
        self.badgeLabel.textAlignment = NSTextAlignmentCenter;
        self.badgeLabel.layer.cornerRadius = frame.size.height/2;
        self.badgeLabel.layer.masksToBounds = YES;
        self.badgeLabel.backgroundColor = UIColor.redColor;
        [self addSubview:self.badgeLabel];
        self.hidden = YES;
    }
    return self;
}

- (void)setType:(SWBBadgeValueType)type
{
    _type = type;
    self.hidden = NO;
    switch (type) {
        case SWBBadgeValueTypeDot:
            {
                self.badgeLabel.size = CGSizeMake(8, 8);
                self.layer.cornerRadius = self.badgeLabel.size.height/2;
                self.badgeLabel.x = 0;
                self.badgeLabel.y = self.height * 0.5 - self.badgeLabel.size.height * 0.5;
            }
            break;
            
        case SWBBadgeValueTypeNew:
            {
                self.badgeLabel.size = CGSizeMake(self.width, self.height);
            }
            break;
            
        case SWBBadgeValueTypeNumber:
            {
                CGSize size = CGSizeZero;
                if (self.badgeLabel.text.length <= 1) {
                    size = CGSizeMake(self.height, self.height);
                }else if (self.badgeLabel.text.length > 1) {
                    size = self.bounds.size;
                }
                self.badgeLabel.size = size;
                self.badgeLabel.layer.cornerRadius = self.height * 0.5;
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
