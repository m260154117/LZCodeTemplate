//
//  MineViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/17.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "MineViewController.h"

@implementation MineViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tbTop = [self creatTopBarView:kTopFrame];
    [self.view addSubview:_tbTop];
}

- (LZTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
    LZTopBar *tbTop = [[LZTopBar alloc] initWithFrame:frame];
    [tbTop.btnTitle setTitle:@"我的" forState:UIControlStateNormal];
    
    
    return tbTop;
}
@end
