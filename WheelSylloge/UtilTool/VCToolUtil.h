//
//  VCToolUtil.h
//  WheelSylloge
//
//  Created by 工作 on 2018/8/22.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCToolUtil : NSObject

#pragma mark- ============ 获取当前的viewcontroller ==============
+ (UIViewController *)getCurrentVC;

#pragma mark- ============ pop到指定的 ==============
+ (void)popToViewController:(NSString *)vcName;

@end
