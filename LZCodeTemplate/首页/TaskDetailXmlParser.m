//
//  TaskDetailXmlParser.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/1/5.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "TaskDetailXmlParser.h"

@implementation TaskDetailXmlParser



+ (NSString *)getTimeStamp
{
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%f",timestamp];
}

@end
