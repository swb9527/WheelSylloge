//
//  SwbADC_TabBarTool.h
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

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
