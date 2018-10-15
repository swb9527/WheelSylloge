//
//  PagerViewConfigration.m
//  WheelSylloge
//
//  Created by 工作 on 2018/8/27.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "PagerViewConfigration.h"

@interface PagerViewConfigration()

@property (nonatomic, strong) NSArray *normalColorArrays;

@property (nonatomic, strong) NSArray *selectedColorArrays;

@property (nonatomic, strong) NSArray *deltaColorArrays;

@end

@implementation PagerViewConfigration

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.pagerViewStyle = PagerViewStyleTop;
        
        self.showConver = NO;
        self.showIndicatorLine = YES;
        self.showBottomLine = YES;
        self.showGradientColor = YES;
        self.showAddButton = NO;
        self.scrollMenu = YES;
        self.bouncesMenu = NO;
        self.aligmentModeCenter = YES;
        self.lineWidthEqualTitleWidth = NO;
        
        self.addButtonBackgroundColor = UIColor.whiteColor;
        self.indicatorLineColor = UIColor.redColor;
        self.converColor = UIColor.groupTableViewBackgroundColor;
        self.pagerViewBackgroundColor = UIColor.whiteColor;
        self.itemTitleNormalColor = UIColor.grayColor;
        self.itemTitleSelectedColor = UIColor.greenColor;
        self.bottomLineColor = UIColor.lightGrayColor;
        self.bottomLineLeftAndRightMargin = 0;
        self.bottomLineCornerRadius = 0;
        self.indicatorLineHeight = 2;
        self.indicatorLineBottomMargin = 0;
        self.indicatorLineCornerRadius = 0;
        self.indicatorLineLeftAndRightAddWidth = 0;
        self.bottomLineHeight = 1;
        self.converHeight = 28;
        self.pagerViewHeight = 44;
        self.pagerViewWidth = SCREEN_WIDTH;
        self.converCornerRadius = 14;
        self.itemMargin = 0;
        self.itemLeftAndRightMargin = 0;
        self.itemTitleNormalFont = [UIFont mediumFontOfSize:14];
        self.itemTitleSelectedFont = [UIFont mediumFontOfSize:14];
        self.itemMaxScale = 0;
    }
    return self;
}

+ (instancetype)defaultConfig
{
    return [[self alloc]init];
}

- (void)setRGBWithProgress:(CGFloat)progress
{
    self.deltaSelR = [self.normalColorArrays[0] floatValue] + [self.deltaColorArrays[0] floatValue] * progress;
    self.deltaSelG = [self.normalColorArrays[1] floatValue] + [self.deltaColorArrays[1] floatValue] * progress;
    self.deltaSelB = [self.normalColorArrays[2] floatValue] + [self.deltaColorArrays[2] floatValue] * progress;
    
    self.deltaNorR = [self.selectedColorArrays[0] floatValue] - [self.deltaColorArrays[0] floatValue] * progress;
    self.deltaNorG = [self.selectedColorArrays[1] floatValue] - [self.deltaColorArrays[1] floatValue] * progress;
    self.deltaNorB = [self.selectedColorArrays[2] floatValue] - [self.deltaColorArrays[2] floatValue] * progress;
}

- (CGFloat)indicatorLineHeight
{
    return self.showIndicatorLine ? _indicatorLineHeight : 0;
}

- (CGFloat)deltaScale
{
    return _deltaScale = self.itemMaxScale - 1.0;
}

/* 得到颜色对应的RGB值 */
- (NSArray *)getRGBValueWithColor:(UIColor *)color
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    [color getRed:&r green:&g blue:&b alpha:&a];
    return @[@(r),@(g),@(b)];
}

- (NSArray *)normalColorArrays
{
    if (!_normalColorArrays) {
        _normalColorArrays = [self getRGBValueWithColor:self.itemTitleNormalColor];
    }
    return _normalColorArrays;
}
- (NSArray *)selectedColorArrays
{
    if (!_selectedColorArrays) {
        _selectedColorArrays = [self getRGBValueWithColor:self.itemTitleSelectedColor];
    }
    return _selectedColorArrays;
}
- (NSArray *)deltaColorArrays
{
    if (!_deltaColorArrays) {
        NSMutableArray *arrayM = [[NSMutableArray alloc]initWithCapacity:self.normalColorArrays.count];
        [self.normalColorArrays enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [arrayM addObject:@([self.selectedColorArrays[idx] floatValue] - [obj floatValue])];
        }];
        
        _deltaColorArrays = [arrayM copy];
    }
    return _deltaColorArrays;
}

@end
