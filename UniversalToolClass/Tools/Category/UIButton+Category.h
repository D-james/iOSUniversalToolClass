//
//  UIButton+Category.h
//  UniversalToolClass
//
//  Created by duanshengwu on 2019/7/11.
//  Copyright © 2019 D-James. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Category)

//只设置button文字
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(NSString *)titleColor fontSize:(CGFloat)fontSize BGColor:(NSString *)hexColor target:(id)target action:(SEL)action;

//只设置button图片
+ (instancetype)buttonWithImage:(NSString *)imageName target:(id)target action:(SEL)action;

//只设置button背景图片
+ (instancetype)buttonWithBackgroundImage:(NSString *)imageName target:(id)target action:(SEL)action;


//设置button文字和背景图片
+ (instancetype)buttonWithBackgroundImage:(NSString *)imageName title:(NSString *)title fontSize:(NSInteger)fontSize titleColor:(NSString *)titleColor target:(id)target action:(SEL)action;


//设置button文字和图片
+ (instancetype)buttonWithImage:(NSString *)imageName title:(NSString *)title fontSize:(NSInteger)fontSize titleColor:(NSString *)titleColor target:(id)target action:(SEL)action;


@end

NS_ASSUME_NONNULL_END
