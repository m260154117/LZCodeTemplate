//
//  FMDataHelper.h
//  PointsMall
//
//  Created by 高大鹏 on 15/11/3.
//  Copyright © 2015年 高大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"
#import "FMDatabaseAdditions.h"
#import "FMDatabase.h"

static NSString *kDicVersionListTable = @"kDicVersionListTable";        //字典版本表
static NSString *kOpenCityTable       = @"kOpenCityTable";              //开通城市
static NSString *kDownNaviMenuTable   = @"kDownNaviMenuTable";          //下导航菜单
static NSString *kRewardTable         = @"kRewardTable";                //签到奖励
static NSString *kOutputVolumeTable   = @"kOutputVolumeTable";          //汽车排量
static NSString *kVehicleNoTable      = @"kVehicleNoTable";             //汽车皮牌
static NSString *kVehicleTypeTable    = @"kVehicleTypeTable";           //汽车类型
static NSString *kUseNatureTable      = @"kUseNatureTable";             //使用性质
static NSString *kCustomerTypeTable   = @"kCustomerTypeTable";          //用户类型
static NSString *kConsumeTypeTable    = @"kConsumeTypeTable";           //消费类型
static NSString *kCityCompanyTable    = @"kCityCompanyTable";           //公司城市

@interface FMDataHelper : NSObject

+ (FMDataHelper *)helper;

- (NSArray *)insertDicVersionList:(NSArray *)array;
- (void)insertDicContentList:(NSArray *)array pid:(NSInteger)parentid;

- (NSArray *)getContentFromTable:(NSString *)tableName;
- (NSArray *)getTabbarItems;

@end
