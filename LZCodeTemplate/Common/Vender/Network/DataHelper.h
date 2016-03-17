//
//  DataHelper.h
//  BSports
//
//  Created by 雷克 on 14/12/25.
//  Copyright (c) 2014年 ist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
//#import "ISTHUDManager.h"
#import "ISTHUDManager.h"

static NSString *kGetSyncDict         = @"/webapi/dict/getDictList";            //同步字典信息
static NSString *kGetDictionaryByPid  = @"/webapi/dict/getDictDetail";          //获取字典项内容
static NSString *kGetUserInfo         = @"/gd/user/getUserInfoByUId";        //获取用户信息
static NSString *kFileUpload          = @"/app/fileUpload";                     //上传文件
static NSString *kSMSCode             = @"/gd/fulecard/sendCode";          //获取手机验证码


@interface DataHelper : NSObject

+ (DataHelper *)defaultHelper;

- (void)checkNetwork;

//网络请求
- (void)requestForURLStr:(NSString*)URLStr requestMethod:(NSString*)requestMethod info:(NSDictionary *)requestInfo andBlock:(void (^)(id response, NSError *error))block;

//网络请求
- (void)testrequestForURLStr:(NSString*)URLStr requestMethod:(NSString*)requestMethod info:(NSDictionary *)requestInfo andBlock:(void (^)(id response, NSError *error))block;
//网络请求
- (void)wscRequestForURLStr:(NSString*)URLStr requestMethod:(NSString*)requestMethod info:(NSDictionary *)requestInfo andBlock:(void (^)(id response, NSError *error))block;

//上传图片
- (void)updateImages:(NSArray *)imageArray urlStr:(NSString *)URLStr info:(NSDictionary *)requestInfo andBlock:(void (^)(id response, NSError *error))block;

- (void)postBodyForUrlStr:(NSString *)UrlStr info:(NSDictionary *)requestInfo andBlock:(void (^)(id response, NSError *error))block;


@end
