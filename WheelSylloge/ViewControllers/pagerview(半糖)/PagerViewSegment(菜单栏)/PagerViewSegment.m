//
//  PagerViewSegment.m
//  WheelSylloge
//
//  Created by 工作 on 2018/8/27.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "PagerViewSegment.h"
#import "GestureScrollView.h"
#import "PagerViewConfigration.h"

#define pagerViewConverMarginX 5
#define pagerViewConverMarginW 10

@interface PagerViewSegment()

/* line 指示器线条 */
@property (nonatomic, strong) UIView *indicatorLineView;

/* 蒙层 */
@property (nonatomic, strong) UIView *converView;

/* 底部滚动ScrollView */
@property (nonatomic, strong) GestureScrollView *scrollView;

/* add按钮 */
@property (nonatomic, strong) UIButton *addButton;

/* 底部线条 */
@property (nonatomic, strong) UIView *bottomLine;

/* 标题数组 */
@property (nonatomic, copy) NSArray *titlesArr;

/* 配置信息 */
@property (nonatomic, strong) PagerViewConfigration *configration;

/* 代理 */
@property (nonatomic, weak) id<PagerViewSegmentDelegate> delegate;

/* 上次index */
@property (nonatomic, assign) NSInteger lastIndex;

/* 当前index */
@property (nonatomic, assign) NSInteger currentIndex;

/* itemsArr */
@property (nonatomic, strong) NSMutableArray *itemsArr;

/* item宽度 */
@property (nonatomic, strong) NSMutableArray *itemWidthArr;

@end

@implementation PagerViewSegment

+ (instancetype)pagerViewSegmentWithFrame:(CGRect)frame titles:(NSArray *)titles configration:(PagerViewConfigration *)configration delegate:(id<PagerViewSegmentDelegate>)delegate defaultIndex:(NSInteger)defaultIndex
{
    if (frame.size.height > 0) {
        configration.pagerViewHeight = frame.size.height;
    }
    if (frame.size.width > 0) {
        configration.pagerViewWidth = frame.size.height;
    }
    
    PagerViewSegment *menuView = [[PagerViewSegment alloc]initWithFrame:frame];
    menuView.titlesArr = titles;
    menuView.delegate = delegate;
    menuView.configration = configration ?: [PagerViewConfigration defaultConfig];
    menuView.currentIndex = defaultIndex;
    menuView.itemsArr = @[].mutableCopy;
    menuView.itemWidthArr = @[].mutableCopy;
    
    [menuView setupSubViews];
    return menuView;
}

- (void)setupSubViews
{
    [self setupItems];
}

- (void)setupItems
{
    [self.titlesArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *itemLabel = [[UILabel alloc]init];
        itemLabel.font = self.configration.itemTitleNormalFont;
        itemLabel.text = obj;
        itemLabel.tag = idx;
        itemLabel.textAlignment = NSTextAlignmentCenter;
        itemLabel.userInteractionEnabled = YES;
        
        [itemLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(itemLabelTapped:)]];
        
        CGFloat width = [obj boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.configration.itemTitleSelectedFont} context:nil].size.width;
        
        [self.itemWidthArr addObject:@(width)];
        [self.itemsArr addObject:itemLabel];
        [self.scrollView addSubview:itemLabel];
    }];
}

- (void)setupOtherViews
{
    self.scrollView.frame = CGRectMake(0, 0, self.configration.showAddButton?self.width-self.height:self.width, self.height);
    [self addSubview:self.scrollView];
    
    if (self.configration.showAddButton) {
        self.addButton.frame = CGRectMake(self.width-self.height, 0, self.height, self.height);
        [self addSubview:self.addButton];
    }
    
    __block CGFloat itemX = 0;
    __block CGFloat itemY = 0;
    __block CGFloat itemW = 0;
    __block CGFloat itemH = self.height - self.configration.indicatorLineHeight;
    
    @WeakObj(self);
    [self.itemsArr enumerateObjectsUsingBlock:^(UILabel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @StrongObj(self);
        if (idx == 0) {
            itemX += self.configration.itemLeftAndRightMargin;
        }else {
            itemX += self.configration.itemMargin + [self.itemWidthArr[idx] floatValue];
        }
        obj.frame = CGRectMake(itemX, itemY, [self.itemWidthArr[idx] floatValue], itemH);
    }];
    
    CGFloat scrollSizeWidth = self.configration.itemLeftAndRightMargin * 2 + CGRectGetMaxX([[self.itemsArr lastObject] frame]);
    
    if (scrollSizeWidth < self.scrollView.width) {
        itemX = 0;
        itemY = 0;
        itemW = 0;
        
        CGFloat left = 0;
        
        for (NSNumber *width in self.itemWidthArr) {
            left += [width floatValue];
        }
        
        left = (self.scrollView.width - left - self.configration.itemMargin * (self.itemWidthArr.count-1)) * 0.5;
        
        /* 居中且有剩余间距 */
        if (self.configration.aligmentModeCenter && left >= 0) {
            [self.itemsArr enumerateObjectsUsingBlock:^(UILabel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                @StrongObj(self);
                if (idx == 0) {
                    itemX += left;
                }else {
                    itemX += self.configration.itemMargin + [self.itemWidthArr[idx-1] floatValue];
                }
                obj.frame = CGRectMake(itemX, itemY, [self.itemWidthArr[idx] floatValue], itemH);
            }];
            self.scrollView.contentSize = CGSizeMake(left*2+CGRectGetMaxX([[self.itemsArr lastObject] frame]), self.scrollView.height);
        }else {
            //不能滚动则平分
            if (!self.configration.scrollMenu) {
                [self.itemsArr enumerateObjectsUsingBlock:^(UILabel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    itemW = self.scrollView.width / self.itemsArr.count;
                    itemX = itemW * idx;
                    obj.frame = CGRectMake(itemX, itemY, itemW, itemH);
                }];
                
                self.scrollView.contentSize = CGSizeMake(CGRectGetMaxX([self.itemsArr.lastObject frame]), self.scrollView.height);
            }else {
                self.scrollView.contentSize = CGSizeMake(scrollSizeWidth, self.scrollView.height);
            }
        }
    }else {
        self.scrollView.contentSize = CGSizeMake(scrollSizeWidth, self.scrollView.height);
    }
    
    UILabel *firstItem = self.itemsArr.firstObject;
    CGFloat lineX = firstItem.x;
    CGFloat lineY = self.scrollView.height - self.configration.indicatorLineHeight;
    CGFloat lineW = firstItem.width;
    CGFloat lineH = self.configration.indicatorLineHeight;
    
    if (!self.configration.scrollMenu && !self.configration.aligmentModeCenter && self.configration.lineWidthEqualTitleWidth) {
        lineX = (firstItem.x + firstItem.width - [self.itemWidthArr.firstObject floatValue]) / 2.0;
        lineW = [self.itemWidthArr.firstObject floatValue];
    }
    
    //conver
    if (self.configration.showConver) {
        self.converView.frame = CGRectMake(lineX-pagerViewConverMarginX, (self.scrollView.height-self.configration.converHeight-self.configration.indicatorLineHeight)*0.5, lineW + pagerViewConverMarginW, self.configration.converHeight);
        [self.scrollView insertSubview:self.converView atIndex:0];
    }
    
    //bottomline
    if (self.configration.showBottomLine) {
        self.bottomLine = [[UIView alloc]init];
        self.bottomLine.backgroundColor = self.configration.bottomLineColor;
        self.bottomLine.frame = CGRectMake(self.configration.bottomLineLeftAndRightMargin, self.scrollView.height-self.configration.bottomLineHeight, self.width-self.configration.bottomLineLeftAndRightMargin*2, self.configration.bottomLineHeight);
        self.bottomLine.layer.cornerRadius = self.configration.bottomLineCornerRadius;
        self.bottomLine.layer.masksToBounds = YES;
        [self addSubview:self.bottomLine];
    }
    
    //IndicatorLine
    if (self.configration.showIndicatorLine) {
        self.indicatorLineView.frame = CGRectMake(lineX-self.configration.indicatorLineLeftAndRightAddWidth, lineY-self.configration.indicatorLineBottomMargin, lineW+self.configration.indicatorLineLeftAndRightAddWidth*2, lineH);
        self.indicatorLineView.layer.cornerRadius = self.configration.indicatorLineCornerRadius;
        self.indicatorLineView.layer.masksToBounds = YES;
        [self.scrollView addSubview:self.indicatorLineView];
    }
    
    if (self.configration.itemMaxScale > 1) {
        ((UILabel *)self.itemsArr[0]).transform = CGAffineTransformMakeScale(self.configration.itemMaxScale, self.configration.itemMaxScale);
    }
}




#pragma mark- ============ Lazy Method ==============
- (UIView *)indicatorLineView
{
    if (!_indicatorLineView) {
        _indicatorLineView = [[UIView alloc]init];
        _indicatorLineView.backgroundColor = self.configration.indicatorLineColor;
    }
    return _indicatorLineView;
}

- (UIView *)converView
{
    if (!_converView) {
        _converView = [[UIView alloc]init];
        _converView.backgroundColor = self.configration.converColor;
        _converView.layer.cornerRadius = self.configration.converCornerRadius;
        _converView.layer.masksToBounds = YES;
        _converView.userInteractionEnabled = NO;
    }
    return _converView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
