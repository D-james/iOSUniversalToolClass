//
//  CommonMethod.h
//  JinSeShiJi
//
//  Created by 段盛武 on 2018/4/13.
//

#import <UIKit/UIKit.h>

@interface CommonMethod : NSObject

//手机型号
+ (NSString*)iphoneType;


#pragma mark - 拨打电话
+ (void)callPhoneNum:(NSString *)phoneNumber;

#pragma mark - GCD定时器
//time 间隔时间     cycleEvent循环事件
+ (dispatch_source_t)timerGCDCutOff:(CGFloat)time  cycleEvent:(void(^)())cycleEvent;

#pragma mark - 识别电话号码,网址，等
+ (NSArray *)recogniseStr:(NSString *)wholeStr checkingTypes:(NSTextCheckingTypes)checkingTypes;

#pragma mark - 照片方向修订
+(UIImage *)fixOrientation:(UIImage *)aImage;

//base64
+(NSString *)base64FromString:(NSString *)string ;

+ (NSString *)base64EncodedStringFrom:(NSData *)data ;


@end
