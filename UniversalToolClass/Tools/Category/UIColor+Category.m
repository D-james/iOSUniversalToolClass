//
//  UIColor+Category.m
//  UniversalToolClass
//
//  Created by duanshengwu on 2019/7/11.
//  Copyright © 2019 D-James. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)


+ (UIColor *)colorRGB255WithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [UIColor colorWithRed:red/255.f  green:green/255.f blue:blue/255.f alpha:1];
}


+ (UIColor *)colorRGB255WithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.f  green:green/255.f blue:blue/255.f alpha:alpha];
}



+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if (cString.length < 6) {
        return [UIColor blackColor];
    }
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if (cString.length != 6 && cString.length != 8) {
        return [UIColor blackColor];
    }
    
    NSRange range;
    range.length = 2;
    range.location = 0;
    
    NSString *alphaString;
    NSString *redString;
    NSString *greenString;
    NSString *blueString;
    
    if (cString.length == 8) {
        alphaString = [cString substringWithRange:range];
        range.location += 2;
    }else{
        alphaString = @"FF";
    }
    redString = [cString substringWithRange:range];
    range.location += 2;
    greenString = [cString substringWithRange:range];
    range.location += 2;
    blueString = [cString substringWithRange:range];
    
    
    unsigned int alpha, red ,green ,blue;
    [[NSScanner scannerWithString:alphaString] scanHexInt:&alpha];
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    
    return [UIColor colorRGB255WithRed:red green:green blue:blue alpha:alpha];
    
}

@end
