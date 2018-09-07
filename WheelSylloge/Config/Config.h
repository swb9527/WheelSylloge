//
//  Config.h
//  WheelSylloge
//
//  Created by 工作 on 2018/8/8.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#ifndef Config_h
#define Config_h

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define StatusBarHeight [[UIApplication sharedApplication]statusBarFrame].size.height
#define NavBarHeight 44.0f
#define TopHeight (StatusBarHeight + NavBarHeight)
#define BottomHeight (iphoneX ? 34 : 0)
#define TabBarHeight (StatusBarHeight > 20 ? 83 : 49)

#endif /* Config_h */
