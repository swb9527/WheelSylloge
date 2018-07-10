//
//  SwbADC_TabBarItem.h
//  WheelSylloge
//
//  Created by 工作 on 2018/7/10.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwbADC_TabBarBadge.m"



@interface SwbADC_TabBarItem : UIControl

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

@end
