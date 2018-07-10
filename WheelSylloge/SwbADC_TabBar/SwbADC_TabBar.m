//
//  SwbADC_TabBar.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "SwbADC_TabBar.h"

@interface SwbADC_TabBar()

/* 模糊效果 毛玻璃 */
@property (nonatomic, strong) UIBlurEffect *effect;
@property (nonatomic, strong) UIVisualEffectView *effectView;

@end

@implementation SwbADC_TabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configuration];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configuration];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configuration];
    }
    return self;
}

- (void)configuration
{
    [self addSubview:self.backgroundImageView]; //添加背景图
    [self.backgroundImageView addSubview:self.effectView];
}











#pragma mark-   懒加载
- (UIBlurEffect *)effect
{
    if (!_effect) {
        _effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    }
    return _effect;
}
- (UIVisualEffectView *)effectView
{
    if (!_effectView) {
        _effectView = [[UIVisualEffectView alloc]initWithEffect:self.effect];
        _effectView.frame = self.bounds;
        _effectView.hidden = YES;
    }
    return _effectView;
}
- (UIImageView *)backgroundImageView
{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc]init];
    }
    return _backgroundImageView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
