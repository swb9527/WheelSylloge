//
//  SwbADC_TabBarItem.h
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwbADC_TabBarBadge.h"

//tabBar中间item凸出的形状
typedef NS_ENUM(NSInteger, SWBTabBarCenterItemStyle) {
    SWBTabBarCenterItemStyleNormal,     //无
    SWBTabBarCenterItemStyleCircular,   //圆形
    SWBTabBarCenterItemStyleSquare,     //方形
};

//item相对在tabBar的独立单元格对齐风格
typedef NS_ENUM(NSInteger, SWBTabBarItemAlignmentStyle) {
    SWBTabBarItemAlignmentStyleCenter,          //居中
    SWBTabBarItemAlignmentStyleCenterTop,       //顶部居中对齐
    SWBTabBarItemAlignmentStyleCenterLeft,      //靠左居中对齐
    SWBTabBarItemAlignmentStyleCenterRight,     //靠右居中对齐
    SWBTabBarItemAlignmentStyleCenterBottom,    //底部居中对齐
    SWBTabBarItemAlignmentStyleTopLeft,         //上左对齐
    SWBTabBarItemAlignmentStyleTopRight,        //上右对齐
    SWBTabBarItemAlignmentStyleBottomLeft,      //下左对齐
    SWBTabBarItemAlignmentStyleBottomRight,     //下右对齐
};

//item内部组件布局风格
typedef NS_ENUM(NSInteger, SWBTabBarItemLayoutStyle) {
    SWBTabBarItemLayoutStyleTopImageBottomTitle,    //上图片下文字
    SWBTabBarItemLayoutStyleBottomImageTopTitle,    //下图片上文字
    SWBTabBarItemLayoutStyleLeftImageRightTitle,    //左图片右文字
    SWBTabBarItemLayoutStyleRightImageLeftTitle,    //右图片左文字
    SWBTabBarItemLayoutStyleSingleIamge,            //只有图片
    SWBTabBarItemLayoutStyleSingleTitle,            //只有文字
};

//item的Badge角标方位
typedef NS_ENUM(NSInteger, SWBTabBarItemBadgeStyle) {
    SWBTabBarItemBadgeStyleTopRight,    //右上方
    SWBTabBarItemBadgeStyleTopCenter,   //顶部居中
    SWBTabBarItemBadgeStyleTopLeft,     //左上方
};

//点击item触发时的交互动效
typedef NS_ENUM(NSInteger, SWBInteractionEffectStyle) {
    SWBInteractionEffectStyleNone,      //无
    SWBInteractionEffectStyleScale,     //缩放弹簧效果
    SWBInteractionEffectStyleShake,     //抖动动画效果
    SWBInteractionEffectStyleOpacity,   //透明过渡效果
    SWBInteractionEffectStyleCustom,    //自定义动画效果
    SWBInteractionEffectStyleRotationY, //Y轴旋转动画效果
};

@class SwbADC_TabBarItem;
//当交互效果选择自定义时，会回调以下Block
typedef void(^CustomInteractionEffectBlock) (SwbADC_TabBarItem *item);

//交互动效的部位
typedef NS_ENUM(NSInteger, SWBInteractionEffectPart) {
    SWBInteractionEffectPartAll,            //整个item
    SWBInteractionEffectPartImageView,      //只有imageView
    SWBInteractionEffectPartTitleLabel,     //只有标题
};

@interface SwbADC_ItemConfigModel : NSObject

/* 标题 */
@property (nonatomic, copy) NSString *itemTitle;
/* 标题默认颜色 */
@property (nonatomic, strong) UIColor *normalColor;
/* 标题选中颜色 */
@property (nonatomic, strong) UIColor *selectColor;

/* item icon 默认图片 */
@property (nonatomic, copy) NSString *normalImageName;
/* 选中图片 */
@property (nonatomic, copy) NSString *selectImageName;
/* 图片默认的tintColor */
@property (nonatomic, strong) UIColor *normalTintColor;
/* 图片选中的tintColor */
@property (nonatomic, strong) UIColor *selectTintColor;

/* item 背景默认color */
@property (nonatomic, strong) UIColor *normalBackgroundColor;
/* 背景选中的color */
@property (nonatomic, strong) UIColor *selectBackgroundColor;
/* item 背景图片 */
@property (nonatomic, strong) UIImageView *backgroundImageView;

/* 中间凸出按钮类型 */
@property (nonatomic, assign) SWBTabBarCenterItemStyle centerItemStyle;
/* 凸出高于TabBar高度 默认15 */
@property (nonatomic, assign) CGFloat bulgeHeight;
/* 突出后圆角 默认0  如果是圆形的圆角，则会根据设置的ItemSize最大宽度自动裁切，设置后将按照此参数进行裁切 */
@property (nonatomic, assign) CGFloat bulgeRoundCorners;
/* item 相对tabBar的对齐模式 */
@property (nonatomic, assign) SWBTabBarItemAlignmentStyle itemAlignmentStyle;
/* item size */
@property (nonatomic, assign) CGSize itemSize;
/* 角标内容 */
@property (nonatomic, copy) NSString *badge;
/* 角标样式 */
@property (nonatomic, assign) SWBBadgeValueType badgeValueType;
/* 角标方位 */
@property (nonatomic, assign) SWBTabBarItemBadgeStyle itemBadgeStyle;
/* badge动画形式 */
@property (nonatomic, assign) SWBTabBarBadgeAnimationType badgeAnimationType;
/* 角标数为零是否自动隐藏角标 默认隐藏 */
@property (nonatomic, assign) BOOL badgeAutomationHidden;

/* titleLabel */
@property (nonatomic, strong) UILabel *titleLabel;
/* iconImageView */
@property (nonatomic, strong) UIImageView *iconImageView;
/* item内部布局模式 */
@property (nonatomic, assign) SWBTabBarItemLayoutStyle itemLayoutStyle;
/* titleLabelSize */
@property (nonatomic, assign) CGSize titleLabelSize;
/* iconImageViewSize */
@property (nonatomic, assign) CGSize iconImageViewSize;
/* 所有组件距离item边距 默认 UIEdgeInsetsMake(5, 5, 5, 5) */
@property (nonatomic, assign) UIEdgeInsets itemEdgeInsets;
/* 图片文字之间的距离 默认 2 */
@property (nonatomic, assign) CGFloat imageTitleSpacing;

/* item点击后的动画效果 */
@property (nonatomic, assign) SWBInteractionEffectStyle interactionEffectStyle;
/* 交互动画的部位 */
@property (nonatomic, assign) SWBInteractionEffectPart interactionEffectPart;
/* 是否允许重复点击触发动画 默认NO */
@property (nonatomic, assign) BOOL isRepeatClick;
/* 当交互效果选择自定义时 会回调以下Block */
@property (nonatomic, copy) CustomInteractionEffectBlock customInteractionEffectBlock;
/* 多个自定义的时候使用区分的Tag */
@property (nonatomic, assign) NSInteger tag;

@end







@interface SwbADC_TabBarItem : UIControl

- (instancetype)initWithModel:(SwbADC_ItemConfigModel *)itemModel;
@property (nonatomic, strong) SwbADC_ItemConfigModel *itemModel;

/* 标题 */
@property (nonatomic, strong) NSString *title;
/* 默认标题颜色 */
@property (nonatomic, strong) UIColor *normalColor;
/* 选中标题颜色 */
@property (nonatomic, strong) UIColor *selectColor;
/* 默认Image */
@property (nonatomic, strong) UIImage *normalImage;
/* 选中Image */
@property (nonatomic, strong) UIImage *selectImage;
/* 默认的图片tintColor */
@property (nonatomic, strong) UIColor *normalTintColor;
/* 选中的图片tintColor */
@property (nonatomic, strong) UIColor *selectTintColor;
/* 默认的item背景color */
@property (nonatomic, strong) UIColor *normalBackgroundColor;
/* 选中的item背景color */
@property (nonatomic, strong) UIColor *selectBackgroundColor;
/* item 背景图 */
@property (nonatomic, strong) UIImageView *backgroundImageView;
/* 角标内容 */
@property (nonatomic, strong) NSString *badge;
/* item所在索引 */
@property (nonatomic, assign) NSInteger itemIndex;
/* 选中状态 */
@property (nonatomic, assign) BOOL isSelect;
/* item imageView */
@property (nonatomic, strong) UIImageView *iconImageView;
/* item label */
@property (nonatomic, strong) UILabel *titleLabel;
/* 角标 view */
@property (nonatomic, strong) SwbADC_TabBarBadge *badgeView;

/* 重新开始布局 */
- (void)itemDidLayoutControl;
/* 点击item执行动画 */
- (void)itemConfigAnimation;

/* 添加双击事件回调 */
- (void)setDoubleTapHandler:(void (^)(void))handler;

@end
