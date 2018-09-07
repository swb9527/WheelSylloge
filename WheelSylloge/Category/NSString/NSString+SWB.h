//
//  NSString+SWB.h
//  WheelSylloge
//
//  Created by 工作 on 2018/8/22.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SWB)

/**
 *  对传入的参数进行nil检查（适合数组和字典内部传值判空--预防崩溃）
 */
+ (NSString *)checkNullString:(NSString *)string;

@end
