//
//  LZActivityModel.h
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/5/13.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZActivityModel : NSObject
@property (nonatomic,strong) NSString * headerImageStr;
@property (nonatomic,strong) NSString * username;
@property (nonatomic,strong) NSString * content;
@property (nonatomic,strong) NSString * date;
@property (nonatomic,strong) NSString * kind;
@property (nonatomic)  NSInteger commentCount;
@property (nonatomic)  NSInteger jokeCount;

@end
