//
//  DataHelper.m
//  BSports
//
//  Created by 雷克 on 14/12/25.
//  Copyright (c) 2014年 ist. All rights reserved.
//

#import "DataHelper.h"
#import "HttpReachabilityHelper.h"
#import "NSString+Util.h"

@implementation DataHelper

static DataHelper *_sharedInst = nil;
 
+ (id)defaultHelper
{
    @synchronized(self){
        if(_sharedInst == nil)
        {
            _sharedInst = [[self alloc] init];
        }
    }
    return _sharedInst;
}

- (id) init
{
    if (self = [super init])
    {
    }
    return self;
}

#pragma mark - 检测网络状况

- (void)checkNetwork
{
    if (![[HttpReachabilityHelper sharedService] checkNetwork]) {
//                kTipAlert(@"网络连接已断开");
//        [[ISTHUD defaultManager] hideHUDInView:_contentView];
        return;
    }
}

- (void)cancelAllRequest
{

}

#pragma mark - 网络请求

- (void)requestForURLStr:(NSString *)URLStr requestMethod:(NSString *)requestMethod info:(NSDictionary *)requestInfo andBlock:(void (^)(id response, NSError *error))block{
    
    
    NSString *urlString = nil;

    if ([requestMethod isEqualToString:@"GET"]) {
        urlString = [self setParameter:requestInfo withBaseUrl:[NSString stringWithFormat:@"%@%@",kMainDomain,URLStr]];
        requestMethod = @"GET";
    }
    else
    {
        urlString = [NSString stringWithFormat:@"%@%@",kMainDomain,URLStr];
    }
    
    urlString = [NSString encodeChineseToUTF8:urlString];
    
    NSLog(@"\n请求路径：%@\n***请求参数：\n%@\n***结束\n\n",urlString,requestInfo);
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.HTTPCookieAcceptPolicy = NSHTTPCookieAcceptPolicyAlways;
    configuration.HTTPShouldSetCookies = YES;
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    [manager setResponseSerializer:[AFJSONResponseSerializer new]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];//[NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setTimeoutInterval:60];
    
    if ([requestMethod isEqualToString:@"POST"]) {
        [manager POST:urlString parameters:requestInfo  success:^(NSURLSessionDataTask *task, id responseObject){
            NSLog(@"\n\n路径:%@\n***请求结果:\n%@\n***结束\n\n", task.response.URL,responseObject);
            block(responseObject,nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"%@",error);
            block(nil,error);
        }];
    } else {
        [manager GET:urlString parameters:nil  success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"\n\n路径:%@\n***请求结果:\n%@\n***结束\n\n", task.response.URL,responseObject);
            block(responseObject,nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"%@",error);
            block(nil,error);
        }];
    }
}

- (void)testrequestForURLStr:(NSString*)URLStr requestMethod:(NSString*)requestMethod info:(NSDictionary *)requestInfo andBlock:(void (^)(id response, NSError *error))block
{
    NSString *urlString = nil;
    
    if ([requestMethod isEqualToString:@"GET"]) {
        urlString = [self setParameter:requestInfo withBaseUrl:[NSString stringWithFormat:@"%@%@",kWscMainDomain,URLStr]];
        requestMethod = @"GET";
    }
    else
    {
        urlString = [NSString stringWithFormat:@"%@%@",kWscMainDomain,URLStr];
    }
    
    urlString = [NSString encodeChineseToUTF8:urlString];
    
    NSLog(@"\n请求路径：%@\n***请求参数：\n%@\n***结束\n\n",urlString,requestInfo);
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.HTTPCookieAcceptPolicy = NSHTTPCookieAcceptPolicyAlways;
    configuration.HTTPShouldSetCookies = YES;
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    [manager setResponseSerializer:[AFJSONResponseSerializer new]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];//[NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setTimeoutInterval:60];
    
    if ([requestMethod isEqualToString:@"POST"]) {
        [manager POST:urlString parameters:requestInfo  success:^(NSURLSessionDataTask *task, id responseObject){
            NSLog(@"\n\n路径:%@\n***请求结果:\n%@\n***结束\n\n", task.response.URL,responseObject);
            block(responseObject,nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"%@",error);
            block(nil,error);
        }];
    } else {
        [manager GET:urlString parameters:nil  success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"\n\n路径:%@\n***请求结果:\n%@\n***结束\n\n", task.response.URL,responseObject);
            block(responseObject,nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"%@",error);
            block(nil,error);
        }];
    }
}

- (void)wscRequestForURLStr:(NSString*)URLStr requestMethod:(NSString*)requestMethod info:(NSDictionary *)requestInfo andBlock:(void (^)(id response, NSError *error))block
{
    NSString *urlString = nil;
    
    if ([requestMethod isEqualToString:@"GET"]) {
        urlString = [self setParameter:requestInfo withBaseUrl:[NSString stringWithFormat:@"%@%@",kWscMainDomain,URLStr]];
        requestMethod = @"GET";
    }
    else
    {
        urlString = [NSString stringWithFormat:@"%@%@",kWscMainDomain,URLStr];
    }
    
    urlString = [NSString encodeChineseToUTF8:urlString];
    
    NSLog(@"\n请求路径：%@\n***请求参数：\n%@\n***结束\n\n",urlString,requestInfo);
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.HTTPCookieAcceptPolicy = NSHTTPCookieAcceptPolicyAlways;
    configuration.HTTPShouldSetCookies = YES;
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    [manager setResponseSerializer:[AFJSONResponseSerializer new]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/plain",nil];//[NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setTimeoutInterval:60];
    
    if ([requestMethod isEqualToString:@"POST"]) {
        [manager POST:urlString parameters:requestInfo  success:^(NSURLSessionDataTask *task, id responseObject){
            NSLog(@"\n\n路径:%@\n***请求结果:\n%@\n***结束\n\n", task.response.URL,responseObject);
            block(responseObject,nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"%@",error);
            block(nil,error);
        }];
    } else {
        [manager GET:urlString parameters:nil  success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"\n\n路径:%@\n***请求结果:\n%@\n***结束\n\n", task.response.URL,responseObject);
            block(responseObject,nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"%@",error);
            block(nil,error);
        }];
    }
}

#pragma mark - 上传图片

- (void)updateImages:(NSArray *)imageArray urlStr:(NSString *)URLStr info:(NSDictionary *)requestInfo andBlock:(void (^)(id response, NSError *error))block
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@",kMainDomain,URLStr];
    urlString = [NSString encodeChineseToUTF8:urlString];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil]];
    [manager.requestSerializer setTimeoutInterval:30];
    [manager POST:urlString parameters:requestInfo constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
        for (int i = 0; i < [imageArray count]; ++i)
        {
            NSString *imageKey = @"file";
            UIImage *image = [imageArray objectAtIndex:i];
            NSData *data = UIImageJPEGRepresentation(image,1.0);
            [formData appendPartWithFileData :data name:imageKey fileName:[NSString stringWithFormat:@"%@.jpg",imageKey] mimeType:@"multipart/form-data"];
        }
    } success:^(AFHTTPRequestOperation *operation,id responseObject) {
        block(responseObject,nil);
        
    } failure:^(AFHTTPRequestOperation *operation,NSError *error) {
        NSLog(@"%@",error);
        block(nil,error);
    }];
}

#pragma mark - PostBody

- (void)postBodyForUrlStr:(NSString *)UrlStr info:(NSDictionary *)requestInfo andBlock:(void (^)(id response, NSError *error))block
{

}

#pragma mark - Url拼接及分割

//拼接路径参数
- (NSString *)setParameter:(NSDictionary *)parameter withBaseUrl:(NSString *)url
{
    NSString *newUrl = [url copy];
    for(NSString *key in parameter.allKeys)
    {
        NSRange ret = [newUrl rangeOfString:@"?"];
        NSString *param = [parameter objectForKey:key];
        if(ret.location == NSNotFound)
        {
            newUrl = [newUrl stringByAppendingFormat:@"?%@=%@", key, param];
        }
        else
        {
            newUrl = [newUrl stringByAppendingFormat:@"&%@=%@", key, param];
        }
    }
    
    return newUrl;
}

//获取路径上的参数；
- (NSDictionary *)getParameter:(NSDictionary *)parameter withBaseUrl:(NSString *)url
{
    NSMutableDictionary *kvDic = [NSMutableDictionary dictionary];
    NSURL *baseUrl = [NSURL URLWithString:url];
    if(baseUrl)
    {
        NSString *parameterString = [baseUrl query];
        NSArray *parameterArray = [parameterString componentsSeparatedByString:@"&"];
        NSMutableDictionary *kvDic = [NSMutableDictionary dictionary];
        for(NSString *kv in parameterArray)
        {
            NSArray *kvArray = [kv componentsSeparatedByString:@"="];
            if([kvArray count] == 2)
            {
                [kvDic setValue:[kvArray objectAtIndex:1] forKey:[kvArray objectAtIndex:0]];
            }
        }
        
    }
    return kvDic;
}



@end
