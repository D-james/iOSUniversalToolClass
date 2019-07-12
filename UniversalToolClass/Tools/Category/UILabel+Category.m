//
//  UILabel+Category.m
//  JinSeShiJi
//
//  Created by 段盛武 on 26/03/2018.
//

#import "UILabel+Category.h"
#import "UIColor+category.h"

@implementation UILabel (Category)

+ (UILabel *)labelWithText:(NSString *)text hexColor:(NSString *)hexColor font:(CGFloat)fontSize{
    
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    if (hexColor == nil) {
        hexColor = @"000000";
    }
    label.textColor = [UIColor colorWithHexString:hexColor];
    
    return label;
}


+ (UILabel *)labelHexColor:(NSString *)hexColor font:(CGFloat)fontSize{
    
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = [UIColor colorWithHexString:hexColor];
    
    return label;
}

@end
