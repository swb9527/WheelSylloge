//
//  BaseViewController.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/17.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.isShowLiftBack = YES;
}



#pragma mark- ============ 子类中创建tableview ==============
- (void)addTableViewWithHeaderRefresh:(BOOL)headerRefresh FooterRefresh:(BOOL)footerRefresh
{
    [self.view addSubview:self.baseTableView];
//    self.refreshToolUtil = [[RefreshToolUtil alloc]initWithTableView:self.baseTableView];
    
    if (headerRefresh) {
        [self initHeaderRefresh];
    }
    if (footerRefresh) {
        [self initFooterRefresh];
    }
}

#pragma mark- ============ 下拉刷新 ==============
- (void)initHeaderRefresh
{
    @WeakObj(self);
    [self.refreshToolUtil dropDownRefresh:^{
        NSLog(@"我下拉刷新了");
        @StrongObj(self);
        [self downLoadRefresh];
    }];
}
- (void)downLoadRefresh
{
    NSLog(@"父类下拉刷新");
}


#pragma mark- ============ 上拉加载 ==============
- (void)initFooterRefresh
{
    @WeakObj(self);
    [self.refreshToolUtil dropUpRefresh:^{
        NSLog(@"我上拉加载了");
        @StrongObj(self);
        [self upLoadRefresh];
    }];
}
- (void)upLoadRefresh
{
    NSLog(@"父类上拉加载");
}

#pragma mark- ============ 懒加载创建tableview ==============
- (UITableView *)baseTableView
{
    if (!_baseTableView) {
        _baseTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, TopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - TopHeight) style:UITableViewStyleGrouped];
//        _baseTableView.delegate = self;
//        _baseTableView.dataSource = self;
        _baseTableView.showsVerticalScrollIndicator = NO;
        _baseTableView.backgroundColor = color_clear;
        _baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _baseTableView.estimatedRowHeight = 0;
        _baseTableView.estimatedSectionFooterHeight = 0;
        _baseTableView.estimatedSectionHeaderHeight = 0;
        adjustsScrollViewInsets_NO(_baseTableView, self);
    }
    return _baseTableView;
}

- (RefreshToolUtil *)refreshToolUtil
{
    if (!_refreshToolUtil) {
        _refreshToolUtil = [[RefreshToolUtil alloc]initWithTableView:self.baseTableView];
    }
    return _refreshToolUtil;
}


#pragma mark- ============ tabbarItem被选中 ==============
- (void)tabBarItemSelected
{
    
}
#pragma mark- ============ 双击被选中的tabbarItem ==============
- (void)selectTabbarItemDoubleTapped
{
    
}



#pragma mark- ============ 动态设置状态栏颜色 ==============
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return _statusBarStyle;
}

- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
    _statusBarStyle = statusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];//通知系统执行preferredStatusBarStyle方法
}

- (void)dealloc
{
    NSLog(@"释放%@",self);
}


/* 是否禁止侧滑返回 */
- (void)setInteractivePopEnabled:(BOOL)interactivePopEnabled
{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = interactivePopEnabled;
    }
}

/**
 *  是否显示返回按钮
 */
- (void)setIsShowLiftBack:(BOOL)isShowLiftBack
{
    _isShowLiftBack = isShowLiftBack;
    NSInteger VCCount = self.navigationController.viewControllers.count;
    //下面判断的意义是 当VC所在的导航控制器中的VC个数大于1 或者 是present出来的VC时，才展示返回按钮，其他情况不展示
    if (isShowLiftBack && ( VCCount > 1 || self.navigationController.presentingViewController != nil)) {
        [self addNavigationItemWithImageNames:@[image_nav_back] isLeft:YES target:self action:@selector(backBtnClicked) tags:nil];
        
    } else {
        self.navigationItem.hidesBackButton = YES;
        UIBarButtonItem *NULLBar = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
        self.navigationItem.leftBarButtonItem = NULLBar;
    }
}
/* 返回上级 */
- (void)backBtnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 导航栏添加item
- (void)addLeftNavItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    
    [self addNavigationItemWithTitles:@[title] isLeft:YES target:target action:action tags:nil];
}

- (void)addLeftNavItemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action {
    
    [self addNavigationItemWithImageNames:@[imageName] isLeft:YES target:target action:action tags:nil];
}

- (void)addRightNavItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    
    [self addNavigationItemWithTitles:@[title] isLeft:NO target:target action:action tags:nil];
}

- (void)addRightNavItemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action {
    
    [self addNavigationItemWithImageNames:@[imageName] isLeft:NO target:target action:action tags:nil];
}

#pragma mark ————— 导航栏 添加图片按钮 —————
/**
 导航栏添加图标按钮
 
 @param imageNames 图标数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    NSMutableArray *items = [NSMutableArray array];
    
    //调整按钮位置（不用了）
    //    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //    //将宽度设为负值
    //    spaceItem.width= -5;
    //    [items addObject:spaceItem];
    
    NSInteger i = 0;
    for (NSString *imageName in imageNames) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        if (isLeft) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
        } else {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        }
        if (i < tags.count) {
            btn.tag = [tags[i++] integerValue];
        }
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

#pragma mark ————— 导航栏 添加文字按钮 —————
- (void)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    NSMutableArray *items = [NSMutableArray array];
    
    //调整按钮位置
    //    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //    //将宽度设为负值
    //    spaceItem.width= -5;
    //    [items addObject:spaceItem];
    
    NSMutableArray *buttonArray = [NSMutableArray array];
    NSInteger i = 0;
    for (NSString *title in titles) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn setTitleColor:UIColor.purpleColor forState:UIControlStateNormal];
        
        if (i < tags.count) {
            btn.tag = [tags[i++] integerValue];
        }
        [btn sizeToFit];
        
        //设置偏移
        if (isLeft) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
        } else {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        }
        
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        [buttonArray addObject:btn];
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
