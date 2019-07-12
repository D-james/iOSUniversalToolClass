//
//  NSString+Category.h
//  JinSeShiJi
//
//  Created by 段盛武 on 2018/4/10.
//

#import <UIKit/UIKit.h>

@interface NSString (Category)

//计算文字所占size
- (CGSize)caculateStrSizeWithMaxWidth:(CGFloat)maxWidth fontSize:(CGFloat)fontSize;

//string转date
- (NSDate *)stringToDateWithDateFormat:(NSString *)dateFormatStr;

//转换为MD5
- (NSString *)toMD5String;


@end
