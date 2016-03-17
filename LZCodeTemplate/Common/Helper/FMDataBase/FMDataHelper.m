//
//  FMDataHelper.m
//  PointsMall
//
//  Created by 高大鹏 on 15/11/3.
//  Copyright © 2015年 高大鹏. All rights reserved.
//

#import "FMDataHelper.h"
#import "SyncDictResult.h"
#import "TabbarItem.h"

#define kLocalDBPath   [kDocumentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"BasicDB.db"]]

@interface FMDataHelper ()
{
    NSArray *_tablesArray;
}

@end

@implementation FMDataHelper

static FMDataHelper *_sharedInst = nil;

+ (id)helper
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInst=[[FMDataHelper alloc] init];
    });
    
    return _sharedInst;
    
}

- (id)init
{
    if (self = [super init])
    {
         _tablesArray = @[kDicVersionListTable, kOpenCityTable, kDownNaviMenuTable, kRewardTable, kOutputVolumeTable ,kVehicleNoTable, kVehicleTypeTable, kUseNatureTable, kCustomerTypeTable, kConsumeTypeTable, kCityCompanyTable];
    }
    return self;
}

- (FMDatabase *)readDataBase
{
    FMDatabase *db = [FMDatabase databaseWithPath:kLocalDBPath];
    if (![db open]) {
        return nil;
    }

    for (NSString *tableName in _tablesArray) {
        NSString *creatTableSql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (sort int,dictid int,curversion int,name text,value text,parentid int)",tableName];
        [db executeUpdate:creatTableSql];
    }
    
    return db;
}

- (void)closeDb
{
    FMDatabase *db = [self readDataBase];
    [db close];
}

#pragma mark - 字典版本表操作

- (NSArray *)insertDicVersionList:(NSArray *)array
{
    FMDatabase *db = [self readDataBase];
    
    NSMutableArray *changedArray = [NSMutableArray array];
    for (NSDictionary *dic in array)
    {
        if (![self checkVersion:dic]) {
            [changedArray addObject:dic];
            
            NSString *deleteSql = [NSString stringWithFormat:@"delete from %@ where dictid = %@",kDicVersionListTable,dic[@"dictid"]];
            [db executeUpdate:deleteSql];
            
            NSString *insertSqlStr = [NSString stringWithFormat:@"INSERT INTO %@ (sort,dictid,curversion,name,value,parentid) VALUES(?,?,?,?,?,?)",kDicVersionListTable];
            [db executeUpdate:insertSqlStr,dic[@"sort"],dic[@"dictid"],dic[@"curversion"],dic[@"name"],dic[@"value"],dic[@"parentid"]];
        }
    }
    
    return [changedArray copy];
}

- (BOOL)checkVersion:(NSDictionary *)dic
{
    NSInteger dictid = [dic[@"dictid"] integerValue];
    NSInteger curversion = [dic[@"curversion"] integerValue];
    
    FMDatabase *db = [self readDataBase];
    NSString *querySqlStr =  [NSString stringWithFormat:@"select * from %@ where dictid = %ld",kDicVersionListTable,(long)dictid];
    FMResultSet *rs = [db executeQuery:querySqlStr];
    BOOL isSame = NO;
    while ([rs next])
    {
        NSInteger version = [rs intForColumn:@"curversion"];
        if (version == curversion) {
            isSame = YES;
        }
    }
    
    [rs close];
    
    return isSame;
}

- (void)insertDicContentList:(NSArray *)array pid:(NSInteger)parentid
{
    FMDatabase *db = [self readDataBase];
    NSString *tableName = _tablesArray[parentid];
    
    NSString *deleteSql = [NSString stringWithFormat:@"delete from %@",tableName];
    [db executeUpdate:deleteSql];
    
    for (NSDictionary *dic in array)
    {
        NSString *insertSqlStr = [NSString stringWithFormat:@"INSERT INTO %@ (sort,dictid,curversion,name,value,parentid) VALUES(?,?,?,?,?,?)",tableName];
        [db executeUpdate:insertSqlStr,dic[@"sort"],dic[@"dictid"],dic[@"curversion"],dic[@"name"],dic[@"value"],dic[@"parentid"]];
    }
}

#pragma mark - 获取字典项内容

- (NSArray *)getContentFromTable:(NSString *)tableName
{
    FMDatabase *db = [self readDataBase];
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    NSString *querySqlStr =  [NSString stringWithFormat:@"select * from %@",tableName];
    FMResultSet *rs = [db executeQuery:querySqlStr];
    while ([rs next])
    {
        SyncDictResult *r = [[SyncDictResult alloc] init];
        r.dictid = [rs intForColumn:@"dictid"];
        r.name = [rs stringForColumn:@"name"];
        
        [resultArray addObject:r];
    }
    
    return resultArray;
}

- (NSArray *)getTabbarItems
{
    FMDatabase *db = [self readDataBase];
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    NSString *querySqlStr =  [NSString stringWithFormat:@"select * from %@ order by sort asc",kDownNaviMenuTable];
    FMResultSet *rs = [db executeQuery:querySqlStr];
    while ([rs next])
    {
        NSString *valueString = [rs stringForColumn:@"value"];
        NSDictionary *dic = [self convertJsonToDictionary:valueString];
        
        TabbarItem *tb = [[TabbarItem alloc] init];
        tb.title = dic[@"title"];
        tb.type = dic[@"type"];
        tb.highlighted = [dic[@"highlight"] boolValue];
        tb.unSelectImg = dic[@"normalImage"];
        tb.selectImg = dic[@"selectedImage"];

        [resultArray addObject:tb];
    }
    
    return [resultArray copy];
}

#pragma mark - Json to Dictionary

- (NSDictionary *)convertJsonToDictionary:(NSString *)jsonString{

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
    
}

@end
