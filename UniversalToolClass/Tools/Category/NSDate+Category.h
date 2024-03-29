//
//  NSDate+Category.h
//  UniversalToolClass
//
//  Created by duanshengwu on 2019/7/11.
//  Copyright © 2019 D-James. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Category)

/// 获取日
+ (NSInteger)day:(NSString *)date;
/// 获取月
+ (NSInteger)month:(NSString *)date;
/// 获取年
+ (NSInteger)year:(NSString *)date;
// 获取星期
+ (NSString *)week:(NSDate *)date;
/// 获取当月第一天周几
+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;
/// 获取当前月有多少天
+ (NSInteger)totaldaysInMonth:(NSDate *)date;
/// 计算两个日期之间相差天数
+ (NSDateComponents *)calcDaysbetweenDate:(NSString *)startDateStr endDateStr:(NSString *)endDateStr;
/// 获取日期
+ (NSString *)timeStringWithInterval:(NSTimeInterval)timeInterval;
///根据具体日期获取时间戳
+ (NSTimeInterval)timeIntervalFromDateString:(NSString *)dateString;

+ (BOOL)isToday:(NSString *)date;
+ (BOOL)isEqualBetweenWithDate:(NSString *)date toDate:(NSString *)toDate;
///格式：2018-01
+ (BOOL)isCurrenMonth:(NSString *)date;

+ (NSString *)weekToStr:(NSInteger)weekInt;

#pragma mark - 阳历节日
- (NSString *)holidayJudgeWithDate;

@end

NS_ASSUME_NONNULL_END
