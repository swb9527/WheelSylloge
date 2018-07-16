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

#define iconImageView_Proportion (2.0/3.0)
#define titleLabel_Proportion (1.0/3.0)
- (void)itemDidLayoutControl
{
    self.backgroundImageView.frame = self.bounds;
    CGRect imageFrame = self.iconImageView.frame;
    CGRect titleFrame = self.titleLabel.frame;
    BOOL isIconImageViewSize = self.itemModel.iconImageViewSize.width || self.itemModel.iconImageViewSize.height;
    BOOL isTitleLabelSize = self.itemModel.titleLabelSize.width || self.itemModel.titleLabelSize.height;
    //除去边距后的最大宽度
    CGFloat marginWidth = self.frame.size.width - self.itemModel.itemEdgeInsets.left - self.itemModel.itemEdgeInsets.right;
    if (isIconImageViewSize) {
        imageFrame.size = self.itemModel.iconImageViewSize;
    }else {
        imageFrame.size = CGSizeMake(marginWidth, self.frame.size.height * iconImageView_Proportion - self.itemModel.itemEdgeInsets.top-5);
    }
    if (isTitleLabelSize) {
        titleFrame.size = self.itemModel.titleLabelSize;
    }else {
        titleFrame.size = CGSizeMake(marginWidth, self.frame.size.height - imageFrame.size.height - self.itemModel.itemEdgeInsets.bottom);
    }
    // 大小计算完毕，开始布局
    self.titleLabel.hidden = NO;
    self.iconImageView.hidden = NO;
    switch (self.itemModel.itemLayoutStyle) {
        case SWBTabBarItemLayoutStyleTopImageBottomTitle:
        {
            //上图下标题  (3:1)
            imageFrame.origin.y = self.itemModel.itemEdgeInsets.top;
            imageFrame.origin.x = (self.frame.size.width - imageFrame.size.width) / 2;
            //label的高度要减去间距
            titleFrame.size.height -= self.itemModel.imageTitleSpacing;
            titleFrame.origin.y = imageFrame.origin.y + imageFrame.size.height + self.itemModel.imageTitleSpacing;
            titleFrame.origin.x = (self.frame.size.width - titleFrame.size.width) / 2;
        }
            break;
        case SWBTabBarItemLayoutStyleBottomImageTopTitle:
        {
            //上标题下图
            titleFrame.origin.y = self.itemModel.itemEdgeInsets.top;
            titleFrame.origin.x = (self.frame.size.width - titleFrame.size.width) / 2;
            titleFrame.size.height = self.frame.size.height * iconImageView_Proportion - self.itemModel.itemEdgeInsets.top - self.itemModel.imageTitleSpacing - 5;
            imageFrame.origin.y = titleFrame.origin.y + titleFrame.size.height + self.itemModel.imageTitleSpacing;
            imageFrame.origin.x = self.itemModel.itemEdgeInsets.left;
            imageFrame.size = CGSizeMake(marginWidth, self.frame.size.height - titleFrame.size.height - titleFrame.origin.y - self.itemModel.itemEdgeInsets.bottom - self.itemModel.imageTitleSpacing);
        }
            break;
        case SWBTabBarItemLayoutStyleLeftImageRightTitle:
        {
            //左图右标题
            // 左右布局要重新计算图片宽度和文本高度 比例要按照相反的1：3计算
            imageFrame.size.width = self.frame.size.width * titleLabel_Proportion;
            titleFrame.size.height = self.frame.size.height - self.itemModel.itemEdgeInsets.top - self.itemModel.itemEdgeInsets.bottom;
            titleFrame.size.width = self.frame.size.width - (imageFrame.size.width + imageFrame.origin.x + self.itemModel.imageTitleSpacing + self.itemModel.itemEdgeInsets.right);
            imageFrame.origin.y = (self.frame.size.height - imageFrame.size.height) / 2;
            imageFrame.origin.x = self.itemModel.itemEdgeInsets.left;
            titleFrame.size.width -= self.itemModel.imageTitleSpacing;
            titleFrame.origin.y = self.itemModel.itemEdgeInsets.top;
            titleFrame.origin.x = imageFrame.size.width + imageFrame.origin.x + self.itemModel.imageTitleSpacing;
        }
            break;
        case SWBTabBarItemLayoutStyleRightImageLeftTitle:
        {
            //右图左文字
            imageFrame.size.width = self.frame.size.width * titleLabel_Proportion;
            titleFrame.size.height = self.frame.size.height - self.itemModel.itemEdgeInsets.top - self.itemModel.itemEdgeInsets.bottom;
            titleFrame.size.width = self.frame.size.width - (imageFrame.size.width + self.itemModel.imageTitleSpacing + self.itemModel.itemEdgeInsets.right);
            titleFrame.origin.x = self.itemModel.itemEdgeInsets.left;
            titleFrame.size.width -= self.itemModel.imageTitleSpacing;
            titleFrame.origin.y = self.itemModel.itemEdgeInsets.top;
            imageFrame.origin.y = (self.frame.size.height-imageFrame.size.height) / 2;
            imageFrame.origin.x = titleFrame.size.width + titleFrame.origin.x + self.itemModel.imageTitleSpacing;
        }
            break;
        case SWBTabBarItemLayoutStyleSingleIamge:
        {
            //只有图片
            imageFrame.size = CGSizeMake(self.frame.size.width - self.itemModel.itemEdgeInsets.left - self.itemModel.itemEdgeInsets.right, self.frame.size.height - self.itemModel.itemEdgeInsets.top - self.itemModel.itemEdgeInsets.bottom);
            imageFrame.origin = CGPointMake(self.itemModel.itemEdgeInsets.left, self.itemModel.itemEdgeInsets.top);
            self.titleLabel.hidden = YES;
        }
            break;
        case SWBTabBarItemLayoutStyleSingleTitle:
        {
            //只有标题
            titleFrame.size = CGSizeMake(self.frame.size.width - self.itemModel.itemEdgeInsets.left - self.itemModel.itemEdgeInsets.right, self.frame.size.height - self.itemModel.itemEdgeInsets.top - self.itemModel.itemEdgeInsets.bottom);
            titleFrame.origin = CGPointMake(self.itemModel.itemEdgeInsets.left, self.itemModel.itemEdgeInsets.top);
            self.iconImageView.hidden = YES;
        }
            break;
            
        default:
            break;
    }
    self.iconImageView.frame = imageFrame;
    self.titleLabel.frame = titleFrame;
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

/* 点击item执行动画 */
- (void)itemConfigAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    switch (self.itemModel.interactionEffectStyle) {
        case SWBInteractionEffectStyleNone:
        {
            //无动画效果
        }
            break;
        case SWBInteractionEffectStyleScale:
        {
            //缩放
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
            animation.duration = 0.6;
            animation.calculationMode = kCAAnimationCubic;
        }
            break;
        case SWBInteractionEffectStyleShake:
        {
            //抖动
            animation.keyPath = @"transform.rotation";
            CGFloat angle = M_PI_4 / 10;
            animation.values = @[@(-angle),@(angle),@(angle)];
            animation.duration = 0.2f;
        }
            break;
        case SWBInteractionEffectStyleOpacity:
        {
            //透明过渡
            animation.keyPath = @"opacity";
            animation.values = @[@1.0,@0.7,@0.5,@0.7,@1.0];
            animation.duration = 0.6;
        }
            break;
        case SWBInteractionEffectStyleRotationY:
        {
            //旋转
            animation.keyPath = @"transform.rotation.y";
            animation.values = @[@(0),@(M_PI/2),@(M_PI),@(M_PI*1.5),@(M_PI*2)];
            animation.duration = 0.6;
        }
            break;
        case SWBInteractionEffectStyleCustom:
        {
            //自定义动画效果
            if (self.itemModel.customInteractionEffectBlock) {
                self.itemModel.customInteractionEffectBlock(self);
            }
        }
            break;
            
        default:
            break;
    }
    if (self.itemModel.interactionEffectPart == SWBInteractionEffectPartAll) {
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
            [view.layer addAnimation:animation forKey:nil];
        }];
    }else if (self.itemModel.interactionEffectPart == SWBInteractionEffectPartImageView) {
        [self.iconImageView.layer addAnimation:animation forKey:nil];
    }else if (self.itemModel.interactionEffectPart == SWBInteractionEffectPartTitleLabel) {
        [self.titleLabel.layer addAnimation:animation forKey:nil];
    }
}

- (void)setItemModel:(SwbADC_ItemConfigModel *)itemModel
{
    _itemModel = itemModel;
    self.backgroundImageView = itemModel.backgroundImageView;
    self.title = itemModel.itemTitle;
    self.normalImage = [UIImage imageNamed:itemModel.normalImageName];
    self.selectImage = [UIImage imageNamed:itemModel.selectImageName];
    self.normalColor = itemModel.normalColor;
    self.selectColor = itemModel.selectColor;
    self.normalTintColor = itemModel.normalTintColor;
    self.selectTintColor = itemModel.selectTintColor;
    self.normalBackgroundColor = itemModel.normalBackgroundColor;
    self.selectBackgroundColor = itemModel.selectBackgroundColor;
    self.titleLabel = itemModel.titleLabel;
    self.iconImageView = itemModel.iconImageView;
    CGRect itemFrame = self.frame;
    itemFrame.size = itemModel.itemSize;
    self.badgeView.automaticHidden = itemModel.badgeAutomationHidden;
    self.frame = itemFrame;
    self.badge = itemModel.badge;
}

- (void)setIsSelect:(BOOL)isSelect
{
    _isSelect = isSelect;
    if (_isSelect) {
        //选中
        self.iconImageView.image = self.selectImage;
        self.titleLabel.textColor = self.selectColor;
        // 如果有设置tintColor，那么就选中图片后将图片渲染成TintColor
        if (self.selectTintColor) {
            self.iconImageView.image = [self.iconImageView.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
            [self.iconImageView setTintColor:self.selectTintColor];
        }
        @WeakObj(self);
        [UIView animateWithDuration:0.3 animations:^{
            @StrongObj(self);
            if (self.selectBackgroundColor) {
                self.backgroundColor = self.selectBackgroundColor;
            }else {
                self.backgroundColor = UIColor.clearColor;
            }
        } completion:nil];
    }else {
        //没选中
        self.iconImageView.image = self.normalImage;
        self.titleLabel.textColor = self.normalColor;
        if (self.normalTintColor) {
            self.iconImageView.image = [self.iconImageView.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
            [self.iconImageView setTintColor:self.normalTintColor];
        }
        @WeakObj(self);
        [UIView animateWithDuration:0.3 animations:^{
            @StrongObj(self);
            if (self.normalBackgroundColor) {
                self.backgroundColor = self.normalBackgroundColor;
            }else {
                self.backgroundColor = UIColor.clearColor;
            }
        } completion:nil];
    }
    self.titleLabel.text = self.title;
}

- (void)setIconImageView:(UIImageView *)iconImageView
{
    _iconImageView = iconImageView;
    [self addSubview:iconImageView];
    self.isSelect = self.isSelect;
}
- (void)setTitleLabel:(UILabel *)titleLabel
{
    _titleLabel = titleLabel;
    [self addSubview:titleLabel];
}
- (void)setBackgroundImageView:(UIImageView *)backgroundImageView
{
    _backgroundImageView = backgroundImageView;
    [self addSubview:backgroundImageView];
}

- (void)setBadge:(NSString *)badge
{
    _badge = badge;
    if (_badge) {
        self.badgeView.badgeText = badge;
        [self itemDidLayoutBadgeView];  //布局Badge
    }
}

- (SwbADC_TabBarBadge *)badgeView
{
    if (!_badgeView) {
        _badgeView = [[SwbADC_TabBarBadge alloc]init];
        CGRect frame = _badgeView.frame;
        frame.size = CGSizeMake(24, 16);
        _badgeView.frame = frame;
        [self addSubview:_badgeView];
    }
    return _badgeView;
}







@end
@implementation SwbADC_ItemConfigModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.normalColor = UIColor.grayColor;
        self.selectColor = UIColor.brownColor;
        self.bulgeHeight = 15;
        self.imageTitleSpacing = 2;
        self.itemEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
        self.isRepeatClick = NO;
        self.centerItemStyle = SWBTabBarCenterItemStyleNormal;
        self.itemAlignmentStyle = SWBTabBarItemAlignmentStyleCenter;
        self.itemBadgeStyle = SWBTabBarItemBadgeStyleTopRight;
        self.badgeAutomationHidden = YES;
        self.itemLayoutStyle = SWBTabBarItemLayoutStyleTopImageBottomTitle;
    }
    return self;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImageView;
}

- (UIImageView *)backgroundImageView
{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc]init];
    }
    return _backgroundImageView;
}

@end


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
