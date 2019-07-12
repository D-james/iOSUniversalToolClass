//
//  UIColor+Category.h
//  UniversalToolClass
//
//  Created by duanshengwu on 2019/7/11.
//  Copyright © 2019 D-James. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Category)


//RGB255
+ (UIColor *)colorRGB255WithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)colorRGB255WithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;


//hex 十六进制
+ (UIColor *)colorWithHexString:(NSString *)hexString;


@end

NS_ASSUME_NONNULL_END
