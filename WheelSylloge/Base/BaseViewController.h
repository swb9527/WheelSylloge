//
//  BaseViewController.h
//  WheelSylloge
//
//  Created by 工作 on 2018/7/17.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshToolUtil.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UITableView *baseTableView;
@property (nonatomic, strong) RefreshToolUtil *refreshToolUtil;

/* 动态改变某个控制器的状态栏颜色 */
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

/* 是否禁止侧滑返回 */
@property (nonatomic, assign) BOOL interactivePopEnabled;



/* 在子类中创建带下拉刷新和上拉加载的tableview */
- (void)addTableViewWithHeaderRefresh:(BOOL)headerRefresh FooterRefresh:(BOOL)footerRefresh;

- (void)downLoadRefresh;
- (void)upLoadRefresh;
/* 返回上级 子类中重写该方法时，如果子类中禁用了侧滑返回，并且需调用popToRootViewController或popToViewController，需先将interactivePopEnabled置为YES*/
- (void)backBtnClicked;

/**
 *  是否显示返回按钮,默认情况是YES
 */
@property (nonatomic, assign) BOOL isShowLiftBack;

/**
 导航栏添加图标按钮
 
 @param imageNames 图标数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

/**
 导航栏添加图标按钮
 
 @param titles 按钮标题数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;


/**
 *  导航栏左侧添加文本按钮
 
 @param title 按钮标题
 @param target 目标
 @param action 点击方法
 */
- (void)addLeftNavItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

/**
 *  导航栏左侧添加图片按钮
 
 @param imageName 按钮图片文件名
 @param target 目标
 @param action 点击方法
 */
- (void)addLeftNavItemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

/**
 *  导航栏右侧添加文本按钮
 
 @param title 按钮标题
 @param target 目标
 @param action 点击方法
 */
- (void)addRightNavItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

/**
 *  导航栏右侧添加图片按钮
 
 @param imageName 按钮图片文件名
 @param target 目标
 @param action 点击方法
 */
- (void)addRightNavItemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;



/* tabBarItem被选中 */
- (void)tabBarItemSelected;
/* 双击被选中的item */
- (void)selectTabbarItemDoubleTapped;

@end
