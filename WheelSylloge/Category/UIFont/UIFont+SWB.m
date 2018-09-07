//
//  UIFont+SWB.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/20.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "UIFont+SWB.h"

@implementation UIFont (SWB)

#pragma mark- ============ 平方字体 ==============
+ (UIFont *)mediumFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithDescriptor:self.mediumFontDescriptor size:fontSize];
}

+ (UIFont *)regularFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithDescriptor:self.regularFontDescriptor size:fontSize];
}

+ (UIFont *)lightFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithDescriptor:self.lightFontDescriptor size:fontSize];
}

#pragma mark- ============ Helvetica NEUE ==============
+ (UIFont *)helveticaNeueMediumFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithDescriptor:self.helveticaNeueMediumFontDescriptor size:fontSize];
}
+ (UIFont *)helveticaNeueRegularFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithDescriptor:self.helveticaNeueRegularFontDescriptor size:fontSize];
}
+ (UIFont *)helveticaNeueLightFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithDescriptor:self.helveticaNeueLightFontDescriptor size:fontSize];
}



+ (UIFontDescriptor *)mediumFontDescriptor
{
    return [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute:@"PingFang SC",UIFontDescriptorNameAttribute:@"PingFangSC-Medium"}];
}
+ (UIFontDescriptor *)regularFontDescriptor
{
    return [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute:@"PingFang SC",UIFontDescriptorNameAttribute:@"PingFangSC-Regular"}];
}
+ (UIFontDescriptor *)lightFontDescriptor
{
    return [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute:@"PingFang SC",UIFontDescriptorNameAttribute:@"PingFangSC-Light"}];
}


+ (UIFontDescriptor *)helveticaNeueMediumFontDescriptor
{
    return [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute:@"Helvetica NEUE",UIFontDescriptorNameAttribute:@"HelveticaNEUE-Medium"}];
}
+ (UIFontDescriptor *)helveticaNeueRegularFontDescriptor
{
    return [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute:@"Helvetica NEUE",UIFontDescriptorNameAttribute:@"HelveticaNEUE-Regular"}];
}
+ (UIFontDescriptor *)helveticaNeueLightFontDescriptor
{
    return [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute:@"Helvetica NEUE",UIFontDescriptorNameAttribute:@"HelveticaNEUE-Light"}];
}

@end
