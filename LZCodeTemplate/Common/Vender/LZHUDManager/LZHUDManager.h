//
//  ISTHUD.h
//  CarLife
//
//  Created by 高大鹏 on 15/12/15.
//  Copyright © 2015年 高大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface LZHUDManager : NSObject <MBProgressHUDDelegate>

@property(nonatomic,strong)NSMutableArray *viewArray;

+ (LZHUDManager *)defaultManager;
//显示持续等待框
- (void)showHUDInView:(UIView *)view withText:(NSString *)text;
//显示提示性等待框，自动消失
- (void)showHUDWithSuccess:(NSString *)text;
- (void)showHUDWithError:(NSString *)text;
- (void)showHUDWithInfo:(NSString *)text;
- (void)showHUDWithLabel:(NSString *)text andDetailLabel:(NSString *)detail;
//隐藏等待框
- (void)hideHUDInView:(UIView *)view;
- (void)hideHUDInView:(UIView *)view AfterDelay:(NSTimeInterval)delay;
- (void)hideAllHUDs;
//改变当前等待框文字
- (void)modifyHUDInView:(UIView *)view Status:(NSString *)status;

@end
