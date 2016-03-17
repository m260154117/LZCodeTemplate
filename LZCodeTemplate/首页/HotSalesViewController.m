//
//  HotSalesViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/17.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "HotSalesViewController.h"

@implementation HotSalesViewController
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
    [tbTop.btnTitle setTitle:@"热卖" forState:UIControlStateNormal];
    
    
    return tbTop;
}
@end
