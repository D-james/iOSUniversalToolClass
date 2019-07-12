//
//  NSString+Category.m
//  JinSeShiJi
//
//  Created by 段盛武 on 2018/4/10.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Category)


//计算文字所占size
- (CGSize)caculateStrSizeWithMaxWidth:(CGFloat)maxWidth fontSize:(CGFloat)fontSize {
    NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@"k"];//替换因空格产生的size计算误差
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGSize size = [str boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:attr context:nil].size;
    return size;
}


//string转date
- (NSDate *)stringToDateWithDateFormat:(NSString *)dateFormatStr {
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = dateFormatStr;
    NSDate *date = [dateFormat dateFromString:self];
    
    return date;
}


//转换为MD5
- (NSString *)toMD5String
{
    const char *cStr = [self UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}

@end
