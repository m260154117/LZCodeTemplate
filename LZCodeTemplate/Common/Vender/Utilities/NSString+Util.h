//
//  NSString+Util.h
//  UsedCar
//
//  Created by Alan on 13-11-8.
//  Copyright (c) 2013年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

+ (NSString *)openUDID;
- (NSString *)md5;
- (NSString *)encrypt3DES;
- (NSString *)decrypt3DES;
- (NSString *)encodeURL;
- (NSString *)trim;
- (NSString *)dNull;
- (NSString *)IMAccount;
- (NSString *)IMPassword;
/* 防止显示（null） */
- (NSString *)dNull:(NSString *)replace;
- (int)lengthUnicode;
- (NSString *)omitForSize:(CGSize)size font:(UIFont *)font;

/* 3DES加密 */
- (NSString *)encrypt3DES:(NSString *)gkey iv:(NSString *)iv;
/* 3DES解密 */
- (NSString *)decrypt3DES:(NSString *)gkey iv:(NSString *)iv;

/*是否包含中文*/
- (BOOL)isChinese;

+ (NSString *)decodeUTF8ToChinese:(NSString *)encodeStr;
+ (NSString *)encodeChineseToUTF8:(NSString *)encodeStr;

+ (NSString *)decodeFromPercentEscapeString: (NSString *) input;
+ (NSString *)encodeToPercentEscapeString: (NSString *) input;

@end

@interface NSString (JSON)
+ (id)convertJsonToObject:(NSString *)jsonString;
+ (NSString *)convertObjectToJson:(id)object;
@end

@interface NSString(NSDate)
/*----返回日期格式如：12月25日/星期四----*/
+(NSString *)getDateString:(NSString *)dateString;
//返回指定格式的当前时间字符串
+(NSString *)timeStamp;
+(NSString *)nowDateFmtStr:(NSString *)fmt;
+(NSString *)dateFmtStr:(NSString *)fmt date:(NSDate *)date;
////2015-03-10T14:35:52.63 格式处理

+(NSString *)dateStringWithFmt:(NSString *)fmt withDate:(NSString *)date;

/*日期字符串截取*/
- (NSString *)cutTimeZone;
- (NSString *)cutTimeZoneSpace;
- (NSString *)dateWithTime;
- (NSString *)dateWithTimeSecond;

@end

@interface NSString(Verify)

//验证手机号码
- (BOOL)isPhone;
//验证身份证
- (BOOL)isIdCard;
//验证邮箱
- (BOOL)isEmail;

@end

