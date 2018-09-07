//
//  ToolUtil.m
//  WheelSylloge
//
//  Created by 工作 on 2018/8/13.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "ToolUtil.h"

@implementation ToolUtil

#pragma mark- 判断字符串是否为空
+ (BOOL)isEmpty:(NSString *)str
{
    if (!str) {
        return YES;
    } else {
        //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return YES;
        } else {
            return NO;
        }
    }
}

#pragma mark- 万能判空
+ (BOOL)isNull:(id)obj
{
    if ([obj isKindOfClass:[NSString class]]) {
        return obj == nil || [obj isEqual:[NSNull null]] || [obj isEqualToString:@"<null>"] || [self isEmpty:obj];
    } else {
        return obj == nil || [obj isEqual:[NSNull null]];
    }
}

#pragma mark- ============ 富文本 ==============
+ (NSMutableAttributedString *)markString:(NSString *)str color:(UIColor *)color font:(UIFont *)font
{
    NSMutableAttributedString *attributedString_M = [[NSMutableAttributedString alloc] initWithString:str ];
    
    if ([self isNull:str]) {
        return attributedString_M;
    }
    if (![self isNull:color]) {
        [attributedString_M addAttribute:NSForegroundColorAttributeName
                                   value:color
                                   range:NSMakeRange(0, str.length)];
    }
    if (![self isNull:font]) {
        [attributedString_M addAttribute:NSFontAttributeName
                                   value:font
                                   range:NSMakeRange(0, str.length)];
    }
    
    return attributedString_M;
}


@end
