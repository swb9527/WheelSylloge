//
//  NSString+SWB.m
//  WheelSylloge
//
//  Created by 工作 on 2018/8/22.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "NSString+SWB.h"

@implementation NSString (SWB)

+ (NSString *)checkNullString:(NSString *)string
{
    if ([string isKindOfClass:[NSNull class]] || string == nil || [string isEqualToString:@"<null>"] || [string isEqual:[NSNull null]]) {
        return @"";
    }
    return string;
}

@end
