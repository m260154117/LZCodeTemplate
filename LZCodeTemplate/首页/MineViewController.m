//
//  MineViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/17.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "MineViewController.h"
#import "LZAnimationView.h"

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation MineViewController{
    
    UITableView * _tableview;
    NSMutableArray * _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tbTop = [self creatTopBarView:kTopFrame];
    _contentView.backgroundColor = kWhiteColor;
    [self.view addSubview:_tbTop];
    
//    LZAnimationView * view = [[LZAnimationView alloc]init];
//    view.frame = self.view.bounds;
//    [_contentView addSubview:view];
    
    [self prepareData];
    [self configureUI];
    
}

-(void)prepareData{
    _dataArray = [NSMutableArray arrayWithArray:@[@"1",@"2"]];
}
-(void)configureUI{
    
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, _contentView.height) style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.tableFooterView = [[UIView alloc]init];
    _tableview.backgroundColor = [UIColor clearColor];
    [_contentView addSubview:_tableview];
}

- (LZTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
    LZTopBar *tbTop = [[LZTopBar alloc] initWithFrame:frame];
    [tbTop.btnTitle setTitle:@"我的" forState:UIControlStateNormal];
    
    
    return tbTop;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    
    [cell.contentView removeAllSubviews];
    
    UIView * bgview = [[UIView alloc]initWithFrame:CGRectMake(10, 10, kScreen_Width-20, 100-20)];
    bgview.backgroundColor = kOrangeColor;
    
    bgview.layer.cornerRadius = kCornerRadius;
    [cell.contentView addSubview:bgview];
    
    UIView * wView = [[UIView alloc]initWithFrame:CGRectMake(8, 12, kScreen_Width-18-0.5, bgview.height-0.5)];
    wView.backgroundColor = kWhiteColor;
    wView.layer.cornerRadius = kCornerRadius;
    wView.clipsToBounds = YES;
    [cell.contentView addSubview:wView];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 72,kScreen_Width, 20)];
//    label.backgroundColor = RGBCOLOR(250.0, 250.0, 250.0);
    
    label.textColor = kWhiteColor;
    label.font = kFontNormal;
//    label.text = @"幸运的一天";
    label.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:label];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
@end
