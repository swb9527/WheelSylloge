//
//  VCToolUtil.m
//  WheelSylloge
//
//  Created by 工作 on 2018/8/22.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "VCToolUtil.h"

@implementation VCToolUtil

#pragma mark- ============ 获取当前的viewcontroller ==============
+ (UIViewController *)getCurrentVC
{
    return [self getVisibleVcFrom:(UIViewController *)appDelegate.window.rootViewController];
}
+ (UIViewController *)getVisibleVcFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        //视图是被presented出来的
        return [self getVisibleVcFrom:rootVC.presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        //根视图是UITabBarController
        currentVC = [self getVisibleVcFrom:[(UITabBarController *)rootVC selectedViewController]];
    }else if ([rootVC isKindOfClass:[UINavigationController class]]) {
        //根视图为UINavigationController
        currentVC = [self getVisibleVcFrom:[(UINavigationController *)rootVC visibleViewController]];
    }else {
        currentVC = rootVC;
    }
    return currentVC;
}


#pragma mark- ============ pop到指定的 ==============
+ (void)popToViewController:(NSString *)vcName
{
    NSArray *vcArrs = [self getCurrentVC].navigationController.viewControllers;
    id vcClass = NSClassFromString(vcName);
    for (UIViewController *tempVC in vcArrs) {
        if ([tempVC isKindOfClass:[vcClass class]]) {
            [[self getCurrentVC].navigationController popToViewController:tempVC animated:YES];
            break;
        }
    }
}

@end
