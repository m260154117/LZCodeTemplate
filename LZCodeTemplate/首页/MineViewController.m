//
//  MineViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/17.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "MineViewController.h"
#import "LZAnimationView.h"

@interface MineViewController ()

@end
@implementation MineViewController{
    
    NSMutableArray * _dataArray;
    UIView * _bgView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tbTop = [self creatTopBarView:kTopFrame];
    _contentView.backgroundColor = kWhiteColor;
    [self.view addSubview:_tbTop];
    
    [self prepareData];
    [self configureUI];
    
}

-(void)prepareData{
    _dataArray = [NSMutableArray array];
}
-(void)configureUI{
    _bgView = [[UIView alloc]init];
    [_contentView addSubview:_bgView];
    
}

- (LZTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
    LZTopBar *tbTop = [[LZTopBar alloc] initWithFrame:frame];
    [tbTop.btnTitle setTitle:@"我的" forState:UIControlStateNormal];
    
    
    return tbTop;
}



@end
