//
//  UILabel+Category.h
//  JinSeShiJi
//
//  Created by 段盛武 on 26/03/2018.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

+ (UILabel *)labelWithText:(NSString *)text hexColor:(NSString *)hexColor font:(CGFloat)fontSize;

+ (UILabel *)labelHexColor:(NSString *)hexColor font:(CGFloat)fontSize;

@end
