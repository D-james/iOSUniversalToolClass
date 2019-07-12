//
//  NSDate+Category.m
//  UniversalToolClass
//
//  Created by duanshengwu on 2019/7/11.
//  Copyright © 2019 D-James. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

#pragma mark -- 获取日
+ (NSInteger)day:(NSString *)date {
    NSDateFormatter  *dateFormatter = [[self class] setDataFormatter];
    NSDate           *startDate     = [dateFormatter dateFromString:date];
    NSDateComponents *components    = [[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:startDate];
    
    return components.day;
}

#pragma mark -- 获取月
+ (NSInteger)month:(NSString *)date {
    NSDateFormatter  *dateFormatter = [[self class] setDataFormatter];
    NSDate           *startDate     = [dateFormatter dateFromString:date];
    NSDateComponents *components    = [[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:startDate];
    
    return components.month;
}

#pragma mark -- 获取年
+ (NSInteger)year:(NSString *)date {
    NSDateFormatter  *dateFormatter = [[self class] setDataFormatter];
    NSDate           *startDate     = [dateFormatter dateFromString:date];
    NSDateComponents *components    = [[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:startDate];
    
    return components.year;
}

#pragma mark -- 获取星期
+ (NSString *)week:(NSDate *)date {
    NSDateComponents *components    = [[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian] components:(NSCalendarUnitWeekday) fromDate:date];
    
    return [self weekToStr:components.weekday - 1];
}

#pragma mark -- 获得当前月份第一天星期几
+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date {
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //设置每周的第一天从周几开始,默认为1,从周日开始
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate     *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    NSUInteger firstWeekday         = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    //若设置从周日开始算起则需要减一,若从周一开始算起则不需要减
    return firstWeekday ;
}

#pragma mark -- 获取当前月共有多少天
+ (NSInteger)totaldaysInMonth:(NSDate *)date {
    NSRange daysInLastMonth = [[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    
    return daysInLastMonth.length;
}

#pragma mark -- 获取日期
+ (NSString *)timeStringWithInterval:(NSTimeInterval)timeInterval {
    NSDateFormatter *dateFormatter = [[self class] setDataFormatter];
    NSDate          *date          = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString        *dateString    = [dateFormatter stringFromDate:date];
    
    return dateString;
}

#pragma mark -- 设置日期格式
+ (NSDateFormatter *)setDataFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-d"];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    return dateFormatter;
}

#pragma mark -- 计算两个日期之间相差天数
+ (NSDateComponents *)calcDaysbetweenDate:(NSString *)startDateStr endDateStr:(NSString *)endDateStr {
    NSDateFormatter *dateFormatter = [[self class] setDataFormatter];
    NSDate          *startDate     = [dateFormatter dateFromString:startDateStr];
    NSDate          *endDate       = [dateFormatter dateFromString:endDateStr];
    
    //利用NSCalendar比较日期的差异
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    /**
     * 要比较的时间单位,常用如下,可以同时传：
     *    NSCalendarUnitDay : 天
     *    NSCalendarUnitYear : 年
     *    NSCalendarUnitMonth : 月
     *    NSCalendarUnitHour : 时
     *    NSCalendarUnitMinute : 分
     *    NSCalendarUnitSecond : 秒
     */
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth;
    
    NSDateComponents *delta = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    
    return delta;
}

+ (NSTimeInterval)timeIntervalFromDateString:(NSString *)dateString {
    static NSDateFormatter *dateFormatter = nil;
    
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [dateFormatter setLocale:[NSLocale currentLocale]];
    }
    
    NSDate         *date    = [dateFormatter dateFromString:dateString];
    NSTimeInterval interval = [date timeIntervalSince1970];
    
    return interval;
}


+ (BOOL)isToday:(NSString *)date {
    BOOL isToday = NO;
    NSString *today = [NSDate timeStringWithInterval:[NSDate date].timeIntervalSince1970];
    if ([date isEqualToString:today]) {
        isToday = YES;
    }
    return isToday;
}

+ (BOOL)isEqualBetweenWithDate:(NSString *)date toDate:(NSString *)toDate {
    BOOL isToday = NO;
    if ([toDate isEqualToString:date]) {
        isToday = YES;
    }
    return isToday;
}

+ (BOOL)isCurrenMonth:(NSString *)date {
    BOOL isCurrenMonth = NO;
    NSString *month = [[NSDate timeStringWithInterval:[NSDate date].timeIntervalSince1970] substringWithRange:NSMakeRange(0, 7)];
    
    if ([date isEqualToString:month]) {
        isCurrenMonth = YES;
    }
    return isCurrenMonth;
}

+ (NSString *)weekToStr:(NSInteger)weekInt {
    switch (weekInt) {
        case 1:
            return @"周一";
            break;
        case 2:
            return @"周二";
            break;
        case 3:
            return @"周三";
            break;
        case 4:
            return @"周四";
            break;
        case 5:
            return @"周五";
            break;
        case 6:
            return @"周六";
            break;
        case 7:
            return @"周日";
            break;
            
            
        default:
            return @"周日";
            break;
    }
}

#pragma mark - 阳历节日
- (NSString *)holidayJudgeWithDate {
    
    NSCalendar *localeCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:self];
    
    NSInteger month = localeComp.month;
    NSInteger day = localeComp.day;
    
    if (month == 1 && day == 1){
        return @"元旦";
        
        //2.14情人节
    }else if (month == 2 && day == 14){
        return @"情人节";
        //清明节
    } else if (month == 4){
        NSString *yearStr = [NSString stringWithFormat:@"%lu",localeComp.year];
        yearStr = [yearStr substringFromIndex:2];
        NSInteger year = yearStr.floatValue;
        
        NSInteger nowDay = (year*0.2422+4.81)-(year/4);
        if (day == nowDay) {
            return @"清明";
        }
        return nil;
        
        //3.8妇女节
    }else if (month == 3 && day == 8){
        return @"妇女节";
        
        //5.1劳动节
    }else if (month == 5 && day == 1){
        return @"劳动节";
        
        //6.1儿童节
    }else if (month == 6 && day == 1){
        return @"儿童节";
        
        //8.1建军节
    }else if (month == 8 && day == 1){
        return @"建军节";
        
        //9.10教师节
    }else if (month == 9 && day == 10){
        return @"教师节";
        
        //10.1国庆节
    }else if (month == 10 && day == 1){
        return @"国庆节";
        
    }else if (month == 12 && day == 25){
        return @"圣诞节";
        
    }
    
    return [self lunarHolidayJudgeWithDate];
}

#pragma mark - 农历节日判断
- (NSString *)lunarHolidayJudgeWithDate {
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:self];
    
    NSInteger month = localeComp.month;
    NSInteger day = localeComp.day;
    
    if(month == 1){
        if (day == 1) {
            //正月初一：春节
            return @"春节";
        }else if (day == 15){
            //正月十五：元宵节
            return @"元宵";
        }
    }else if(month == 2 && day == 2){
        
        //二月初二：春龙节(龙抬头)
        return @"龙抬头";
        
    }else if(month == 5 && day == 5){
        
        //五月初五：端午节
        return @"端午";
        
    }else if(month == 7 && day == 7){
        
        //七月初七：七夕情人节
        return @"七夕";
        
    }else if(month == 8 && day == 15){
        
        //八月十五：中秋节
        return @"中秋";
        
    }else if(month == 9 && day == 9){
        
        //九月初九：重阳节、中国老年节（义务助老活动日）
        return @"重阳";
        
    }else if(month == 12){
        if (day == 8) {
            //腊月初八：腊八节
            return @"腊八";
        }else if (day == 24){
            //腊月二十四 小年
            return @"小年";
        }else if (day == 30){
            //腊月三十（小月二十九）：除夕
            return @"除夕";
        }
        
    }
    return nil;
}


@end
