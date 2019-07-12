//
//  UIButton+Category.m
//  UniversalToolClass
//
//  Created by duanshengwu on 2019/7/11.
//  Copyright © 2019 D-James. All rights reserved.
//

#import "UIButton+Category.h"
#import "UIColor+Category.h"

@implementation UIButton (Category)

#pragma mark - 外部方法

//只设置button文字
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(NSString *)titleColor fontSize:(CGFloat)fontSize BGColor:(NSString *)hexColor target:(id)target action:(SEL)action
{
    UIButton *button = [self customBtnTarget:target action:action];
    [self titleWithButton:button title:title fontSize:fontSize titleColor:titleColor];
    
    if (hexColor == nil) {
        button.backgroundColor = [UIColor clearColor];
    }else {
        button.backgroundColor = [UIColor colorWithHexString:hexColor];
    }

    return button;
}

//只设置button图片
+ (instancetype)buttonWithImage:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIButton *button = [self customBtnTarget:target action:action];
    
    [self imageWithButton:button imageName:imageName];
    
    return button;
}

//只设置button背景图片
+ (instancetype)buttonWithBackgroundImage:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIButton *button = [self customBtnTarget:target action:action];
    
    [self imageWithButton:button bgImageName:imageName];
    
    return button;
}


//设置button文字和背景图片
+ (instancetype)buttonWithBackgroundImage:(NSString *)imageName title:(NSString *)title fontSize:(NSInteger)fontSize titleColor:(NSString *)titleColor target:(id)target action:(SEL)action
{
    UIButton *button = [self customBtnTarget:target action:action];
    
    [self titleWithButton:button title:title fontSize:fontSize titleColor:titleColor];
    
    [self imageWithButton:button bgImageName:imageName];
    
    return button;
}


//设置button文字和图片
+ (instancetype)buttonWithImage:(NSString *)imageName title:(NSString *)title fontSize:(NSInteger)fontSize titleColor:(NSString *)titleColor target:(id)target action:(SEL)action
{
    UIButton *button = [self customBtnTarget:target action:action];
    
    [self titleWithButton:button title:title fontSize:fontSize titleColor:titleColor];
    
    [self imageWithButton:button imageName:imageName];
    
    return button;
}


#pragma mark - 内部方法
//初始化button
+ (UIButton *)customBtnTarget:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


//给button设置标题
+ (void)titleWithButton:(UIButton *)button title:(NSString *)title fontSize:(NSInteger)fontSize titleColor:(NSString *)titleColor {
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:titleColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
}


//button设置图片
+ (void)imageWithButton:(UIButton *)button imageName:(NSString *)imageName {
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_Highlighted",imageName]] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_Selected",imageName]] forState:UIControlStateSelected];
}


//button设置背景图片
+ (void)imageWithButton:(UIButton *)button bgImageName:(NSString *)bgImageName {
    [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_Highlighted",bgImageName]] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_Selected",bgImageName]] forState:UIControlStateSelected];
}

@end
