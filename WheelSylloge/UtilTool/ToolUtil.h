//
//  ToolUtil.h
//  WheelSylloge
//
//  Created by 工作 on 2018/8/13.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolUtil : NSObject

#pragma mark- ============ 万能判空 ==============
+ (BOOL)isNull:(id)obj;

#pragma mark- ============ 富文本 ==============
+ (NSMutableAttributedString *)markString:(NSString *)str color:(UIColor *)color font:(UIFont *)font;

@end
