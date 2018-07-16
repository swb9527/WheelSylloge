//
//  SwbADC_TabBar.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "SwbADC_TabBar.h"

#define screenWidth ([UIScreen mainScreen].bounds.size.width)
#define itemTag 100

@interface SwbADC_TabBar()

@property (nonatomic, strong) NSMutableArray <SwbADC_TabBarItem*>*items;

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

- (instancetype)initWithTabBarConfig:(NSArray<SwbADC_ItemConfigModel *> *)tabBarConfigModels
{
    self = [super init];
    if (self) {
        [self configuration];
        [self setTabBarConfigModels:tabBarConfigModels];
    }
    return self;
}

- (void)configuration
{
    [self addSubview:self.backgroundImageView]; //添加背景图
    [self.backgroundImageView addSubview:self.effectView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self viewDidLayoutItems];
}

- (void)setTabBarConfigModels:(NSArray<SwbADC_ItemConfigModel *> *)tabBarConfigModels
{
    _tabBarConfigModels = tabBarConfigModels;
    @WeakObj(self);
    [tabBarConfigModels enumerateObjectsUsingBlock:^(SwbADC_ItemConfigModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @StrongObj(self);
        SwbADC_TabBarItem *item = [[SwbADC_TabBarItem alloc]initWithModel:obj];
        item.itemIndex = idx;
        item.tag = itemTag + idx;
        [item addTarget:self action:@selector(click_tabBarItem:) forControlEvents:UIControlEventTouchUpInside];
        if (!idx) {
            item.isSelect = YES;
        }
        [self addSubview:item];
        [self.items addObject:item];
    }];
}

//item布局
- (void)viewDidLayoutItems
{
    CGFloat itemWidth = screenWidth / self.items.count;
    [self.items enumerateObjectsUsingBlock:^(SwbADC_TabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect itemFrame = item.frame;
        CGFloat itemHeight = self.frame.size.height;
        if (iphoneX || itemHeight > 50) {
            itemHeight = 49;
        }
        BOOL isNoSettingItemSize = !item.itemModel.itemSize.width || !item.itemModel.itemSize.height;
        if (isNoSettingItemSize) {
            itemFrame.origin.x = idx * itemWidth;
            itemFrame.size = CGSizeMake(itemWidth, itemHeight);
        }else {
            //自定义itemSize
            itemFrame.size = item.itemModel.itemSize;
        }
        //对齐方式
        switch (item.itemModel.itemAlignmentStyle) {
            case SWBTabBarItemAlignmentStyleCenter:
            {
                //居中 默认
                itemFrame.origin.x = idx * itemWidth + (itemWidth - itemFrame.size.width) / 2;
                itemFrame.origin.y = (itemHeight - itemFrame.size.height) / 2;
            }
                break;
            case SWBTabBarItemAlignmentStyleCenterTop:
            {
                //顶部 居中
                itemFrame.origin.x = idx * itemWidth + (itemWidth - itemFrame.size.width) / 2;
                itemFrame.origin.y = 0;
            }
                break;
            case SWBTabBarItemAlignmentStyleCenterLeft:
            {
                //靠左 居中
                itemFrame.origin.x = idx * itemWidth;
                itemFrame.origin.y = (itemHeight - itemFrame.size.height) / 2;
            }
                break;
            case SWBTabBarItemAlignmentStyleCenterRight:
            {
                //靠右 居中
                itemFrame.origin.x = idx * itemWidth + (itemWidth - itemFrame.size.width);
                itemFrame.origin.y = (itemHeight - itemFrame.size.height) / 2;
            }
                break;
            case SWBTabBarItemAlignmentStyleCenterBottom:
            {
                //底部 居中
                itemFrame.origin.x = idx * itemWidth + (itemWidth - itemFrame.size.width) / 2;
                itemFrame.origin.y = itemHeight - itemFrame.size.height;
            }
                break;
            case SWBTabBarItemAlignmentStyleTopLeft:
            {
                //上左对齐
                itemFrame.origin.x = idx * itemWidth;
                itemFrame.origin.y = 0;
            }
                break;
            case SWBTabBarItemAlignmentStyleTopRight:
            {
                //上右对齐
                itemFrame.origin.x = idx * itemWidth + (itemWidth - itemFrame.size.width);
                itemFrame.origin.y = 0;
            }
                break;
            case SWBTabBarItemAlignmentStyleBottomLeft:
            {
                //下左对齐
                itemFrame.origin.x = idx * itemWidth;
                itemFrame.origin.y = itemHeight - itemFrame.size.height;
            }
                break;
            case SWBTabBarItemAlignmentStyleBottomRight:
            {
                //下右对齐
                itemFrame.origin.x = idx * itemWidth + (itemWidth - itemFrame.size.width);
                itemFrame.origin.y = itemHeight - itemFrame.size.height;
            }
                break;
                
            default:
                break;
        }
        item.frame = itemFrame;
        //通知item同时开始计算坐标
        [item itemDidLayoutControl];
    }];
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
- (NSMutableArray<SwbADC_TabBarItem *> *)items
{
    if (!_items) {
        _items = [[NSMutableArray alloc]init];
    }
    return _items;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
