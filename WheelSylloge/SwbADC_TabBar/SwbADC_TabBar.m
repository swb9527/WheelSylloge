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
    self.backgroundColor = UIColor.whiteColor;
    [self addSubview:self.backgroundImageView]; //添加背景图
    [self.backgroundImageView addSubview:self.effectView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self viewDidLayoutItems];
    [self itemDidLayoutCenterBulgeItem];
}
//- (void)layoutTabBarSubViews
//{
//    self.backgroundImageView.frame = self.frame;
//    self.effectView.frame = self.frame;
//}

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

static SwbADC_TabBarItem *selectedItem;
//点击tabBarItem
- (void)click_tabBarItem:(SwbADC_TabBarItem *)item
{
    NSInteger itemIndex = item.itemIndex;
    [self switch_tabBarItemIndex:itemIndex WithAnimation:YES];
}
//切换页面
- (void)switch_tabBarItemIndex:(NSInteger)index WithAnimation:(BOOL)animation
{
    //切换选择item的选中状态
    [self.items enumerateObjectsUsingBlock:^(SwbADC_TabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        item.isSelect = index == idx;//当前点击的item选中，其他item选中状态置为NO
    }];
    SwbADC_TabBarItem *item = self.items[index];
    if (item.itemModel.isRepeatClick) {
        //允许item重复点击
        if (animation) {
            [item itemConfigAnimation];//item动画
        }
        if (self.delegate && [self.delegate respondsToSelector:@selector(swbADC_TabBar:didSelectIndex:)]) {
            [self.delegate swbADC_TabBar:self didSelectIndex:index];
        }
    }else {
        if (![selectedItem isEqual:item]) {//不是上次点击的item
            selectedItem = item;
            if (animation) {
                [item itemConfigAnimation];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(swbADC_TabBar:didSelectIndex:)]) {
                [self.delegate swbADC_TabBar:self didSelectIndex:index];
            }
        }
    }
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

//设置badge
- (void)setBadgeValue:(NSString *)badgeValue atIndex:(NSInteger)index
{
    if (index < self.items.count) {
        SwbADC_TabBarItem *item = self.items[index];
        item.badge = badgeValue;
    }else {
        NSException *excp = [NSException exceptionWithName:@"Error" reason:@"数组越界" userInfo:nil];
        [excp raise];//抛出异常
    }
}

//适配中间的凸出按钮
- (void)itemDidLayoutCenterBulgeItem
{
    CGFloat itemWidth = self.frame.size.width / self.items.count;
    CGFloat itemHeight = self.frame.size.height;
    [self.items enumerateObjectsUsingBlock:^(SwbADC_TabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect itemFrame = item.frame;
        switch (item.itemModel.centerItemStyle) {
            case SWBTabBarCenterItemStyleNormal:
                //无
                break;
            case SWBTabBarCenterItemStyleCircular:
            {
                //圆形
                itemFrame.size = CGSizeMake(itemHeight + item.itemModel.bulgeHeight, itemHeight + item.itemModel.bulgeHeight);
                itemFrame.origin.y = -item.itemModel.bulgeHeight;
                itemFrame.origin.x = idx * itemWidth + (itemWidth - (itemHeight+item.itemModel.bulgeHeight)) / 2;
                item.frame = itemFrame;
                item.layer.masksToBounds = YES;
                if (item.itemModel.bulgeRoundCorners) {
                    item.layer.cornerRadius = item.itemModel.bulgeRoundCorners;
                }else {
                    item.layer.cornerRadius = (itemWidth+item.itemModel.bulgeHeight) / 2;
                }
            }
                break;
            case SWBTabBarCenterItemStyleSquare:
            {
                //矩形
                itemFrame.size = CGSizeMake(itemHeight + item.itemModel.bulgeHeight, itemHeight + item.itemModel.bulgeHeight);
                itemFrame.origin.y = -item.itemModel.bulgeHeight;
                itemFrame.origin.x = idx * itemWidth + (itemHeight + item.itemModel.bulgeHeight) / 2;
                item.frame = itemFrame;
                if (item.itemModel.bulgeRoundCorners) {
                    item.layer.masksToBounds = YES;
                    item.layer.cornerRadius = item.itemModel.bulgeRoundCorners;
                }
            }
                break;
                
            default:
                break;
        }
        item.frame = itemFrame;
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
        _backgroundImageView.frame = self.bounds;
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

- (NSArray<SwbADC_TabBarItem *> *)tabBarItems
{
    return self.items;
}
- (SwbADC_TabBarItem *)selectedItem
{
    return [self.tabBarItems objectAtIndex:self.selectedIndex];
}
- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    [self switch_tabBarItemIndex:selectedIndex WithAnimation:NO];
}
- (void)setSelectIndex:(NSInteger)selectIndex withAnimation:(BOOL)animation
{
    _selectedIndex = selectIndex;
    [self switch_tabBarItemIndex:selectIndex WithAnimation:animation];
}
- (void)setTranslucent:(BOOL)translucent
{
    _translucent = translucent;
    self.effectView.hidden = !translucent;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
