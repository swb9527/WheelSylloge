//
//  BaseNavigationController.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/18.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WeakSelf;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
//    for (Class classes in self.viewControllers) {
//        if ([viewController isKindOfClass:classes]) {
//            if (self.navigationController.viewControllers.count > 0) {
//                viewController.hidesBottomBarWhenPushed = YES;
//            } else {
//                viewController.hidesBottomBarWhenPushed = NO;
//            }
//        } else {
//            viewController.hidesBottomBarWhenPushed = YES;
//        }
//    }
//    [super pushViewController:viewController animated:animated];
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }else {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];
}

//- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
//{
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.interactivePopGestureRecognizer.enabled = YES;
//    }
//    return [super popToRootViewControllerAnimated:animated];
//}

#pragma mark- ============ 动态改变控制器的状态栏颜色 ==============
- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

#pragma mark- ============ 自定义leftBarButtonItem时 侧滑返回 ==============
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ( gestureRecognizer == self.interactivePopGestureRecognizer ) {
        if ( self.viewControllers.count < 2 || self.visibleViewController == [self.viewControllers objectAtIndex:0] ) {
            return NO;
        }
    }
    return YES;
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
