//
//  AppDelegate.h
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 15/12/30.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZContentViewController.h"
#import "LZBaseNavigationController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LZContentViewController *mainVC;
@property (strong, nonatomic) LZBaseNavigationController *rootNavigation;

@end

