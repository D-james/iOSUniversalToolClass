//
//  CommonMethod.m
//  JinSeShiJi
//
//  Created by 段盛武 on 2018/4/13.
//

#import "CommonMethod.h"
#import <sys/utsname.h>
static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

@implementation CommonMethod


#pragma mark - 识别电话号码,网址，等
+ (NSArray *)recogniseStr:(NSString *)wholeStr checkingTypes:(NSTextCheckingTypes)checkingTypes{
    NSError *error;
    NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:checkingTypes error:&error];
    NSArray *arrayOfAllMatches=[dataDetector matchesInString:wholeStr options:NSMatchingReportProgress range:NSMakeRange(0, wholeStr.length)];
    
    return arrayOfAllMatches;
    
}

#pragma mark - 判断手机型号
//device model 或者叫 machine name
//https://www.theiphonewiki.com/wiki/Models
+ (NSString*)iphoneType {
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString*platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];

    
    if([platform isEqualToString:@"iPhone3,1"])return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,2"])return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,3"])return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone4,1"])return@"iPhone 4S";
    
    if([platform isEqualToString:@"iPhone5,1"])return@"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,2"])return@"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,3"])return@"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone5,4"])return@"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone6,1"])return@"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone6,2"])return@"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone7,1"])return@"iPhone 6 Plus";
    
    if([platform isEqualToString:@"iPhone7,2"])return@"iPhone 6";
    
    if([platform isEqualToString:@"iPhone8,1"])return@"iPhone 6s";
    
    if([platform isEqualToString:@"iPhone8,2"])return@"iPhone 6s Plus";
    
    if([platform isEqualToString:@"iPhone8,4"])return@"iPhone SE";
    
    if([platform isEqualToString:@"iPhone9,1"])return@"iPhone 7";
    
    if([platform isEqualToString:@"iPhone9,2"])return@"iPhone 7 Plus";
    
    if([platform isEqualToString:@"iPhone10,1"] || [platform isEqualToString:@"iPhone10,4"]) {
        return@"iPhone 8";
        
    }else if([platform isEqualToString:@"iPhone10,2"] || [platform isEqualToString:@"iPhone10,5"]) {
        return@"iPhone 8 Plus";
        
    }else if([platform isEqualToString:@"iPhone10,3"] || [platform isEqualToString:@"iPhone10,6"]){
        return@"iPhone X";
        
    }else if([platform isEqualToString:@"iPhone11,2"]) {
        return@"iPhone XS";
        
    }else if([platform isEqualToString:@"iPhone11,8"]) {
        return@"iPhone XR";
        
    }else if([platform isEqualToString:@"iPhone11,4"] || [platform isEqualToString:@"iPhone11,6"]) {
        return@"iPhone XS MAX";
    }
    return @"iPhone X";
}



#pragma mark - 拨打电话
+ (void)callPhoneNum:(NSString *)phoneNumber {
    NSString *phoneStr = [NSString stringWithFormat:@"tel:%@",phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneStr]];
}

#pragma mark - GCD定时器
//time 间隔时间     cycleEvent循环事件
+ (dispatch_source_t)timerGCDCutOff:(CGFloat)time  cycleEvent:(void(^)())cycleEvent{
    //获取全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //将计时器放到队列中
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置计时器执行时间，间隔，精确度
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, time*NSEC_PER_SEC, 0*NSEC_PER_SEC);
    //设置执行事件
    dispatch_source_set_event_handler(timer, ^{
        
        //如果有UI更新的操作的话，需要在dispatch_async中执行
        dispatch_async(dispatch_get_main_queue(), ^{
            
            cycleEvent();
        });
    });
    
    //在这之前是创建定时器，之后就是启动定时器
    dispatch_resume(timer);
    
    return timer;
}


#pragma mark - 照片方向修订
+(UIImage *)fixOrientation:(UIImage *)aImage
{
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp){
        return aImage;
        
    }
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


+(NSString *)base64FromString:(NSString *)string {
    if (string && ![string isEqualToString:@""]) {
        NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
        return  [self base64EncodedStringFrom:data];
    }
    else{
        return  @"";
    }
}

+ (NSString *)base64EncodedStringFrom:(NSData *)data
{
    if ([data length] == 0)
        return @"";
    
    char *characters = malloc((([data length] + 2) / 3) * 4);
    if (characters == NULL)
        return nil;
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    while (i < [data length])
    {
        char buffer[3] = {0,0,0};
        short bufferLength = 0;
        while (bufferLength < 3 && i < [data length])
            buffer[bufferLength++] = ((char *)[data bytes])[i++];
        
        //  Encode the bytes in the buffer to four characters, including padding "=" characters if necessary.
        characters[length++] = encodingTable[(buffer[0] & 0xFC) >> 2];
        characters[length++] = encodingTable[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
        if (bufferLength > 1)
            characters[length++] = encodingTable[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
        else characters[length++] = '=';
        if (bufferLength > 2)
            characters[length++] = encodingTable[buffer[2] & 0x3F];
        else characters[length++] = '=';
    }
    
    return [[NSString alloc] initWithBytesNoCopy:characters length:length encoding:NSASCIIStringEncoding freeWhenDone:YES];
}

@end
