//
//  Macro.h
//  UniversalToolClass
//
//  Created by duanshengwu on 2019/7/11.
//  Copyright © 2019 D-James. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/// 屏幕尺寸
#define ScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight  ([UIScreen mainScreen].bounds.size.height)


#define iPhoneX ((mScreenHeight == 812.0 || mScreenHeight == 896.0) ? YES : NO)

// 状态栏高度
#define STATUSBAR_HEIGHT  ([[UIApplication sharedApplication] statusBarFrame].size.height)
//导航栏高度
#define NAVIGATIONBAR_HEIGHT 44
//导航栏+状态栏
#define StatusBarAndNavigationBarHeight (SYS_STATUSBAR_HEIGHT + NAVIGATIONBAR_HEIGHT)
//底部安全距离
#define kBottomSafeSpace (iPhoneX ? 34.0 : 0.0)
//底部+tabBar距离
#define kTabBarHeight  (49.f + kBottomSpace)


#endif /* Macro_h */
