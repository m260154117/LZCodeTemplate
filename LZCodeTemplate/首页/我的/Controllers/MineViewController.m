//
//  MineViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/17.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "MineViewController.h"
#import "LZAnimationView.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation MineViewController{
    
    NSMutableArray * _dataArray;
    UITableView * _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tbTop = [self creatTopBarView:kTopFrame];
    _contentView.backgroundColor = kMainBGColor;
    [self.view addSubview:_tbTop];
    
    [self prepareData];
    [self configureUI];
    
}

-(void)prepareData{
    _dataArray = [NSMutableArray array];
    
    NSDictionary * dic = @{@"title":@"清除缓存"};
    NSDictionary * dic1 = @{@"title":@"意见反馈"};
    NSDictionary * dic2 = @{@"title":@"关于糗百"};
    
    [_dataArray addObject:dic];
    [_dataArray addObject:dic1];
    [_dataArray addObject:dic2];
}
-(void)configureUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, _contentView.width, _contentView.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc]init];
    [_contentView addSubview:_tableView];
    
}

- (LZTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
    LZTopBar *tbTop = [[LZTopBar alloc] initWithFrame:frame];
    [tbTop.btnTitle setTitle:@"我的" forState:UIControlStateNormal];
    
    
    return tbTop;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return kAdjustLength(300);
    }else if (indexPath.section == 1){
        return kAdjustLength(150);
    }
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 3;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kAdjustLength(60);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc]initLineWithFrame:CGRectMake(0, 0, _tableView.width, kAdjustLength(60)) color:[UIColor clearColor]];
    return view;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    [cell.contentView removeAllSubviews];
    cell.backgroundColor = kWhiteColor;
    cell.contentView.backgroundColor = kWhiteColor;
    
    if (indexPath.section == 0) {
        
        
        UIImageView * iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"default_user.jpg"]];
        iconImageView.clipsToBounds = YES;
        iconImageView.frame = CGRectMake(kAdjustLength(20), kAdjustLength(50), kAdjustLength(200), kAdjustLength(200));
        iconImageView.layer.cornerRadius = kAdjustLength(100);
        [cell.contentView addSubview:iconImageView];
        
        UILabel * namelabel = [[UILabel alloc]init];
    namelabel.frame = CGRectMake(iconImageView.maxX+kAdjustLength(40), kAdjustLength(80), _tableView.width-kAdjustLength(220)-kAdjustLength(100), kAdjustLength(70));
    namelabel.backgroundColor = [UIColor clearColor];
    namelabel.font = kFontLarge_1;
    namelabel.textColor = kDarkTextColor;
    namelabel.textAlignment = NSTextAlignmentLeft;
    namelabel.text = @"路人甲";
    [cell.contentView addSubview:namelabel];
        
        UILabel * namelabel1 = [[UILabel alloc]init];
        namelabel1.frame = CGRectMake(iconImageView.maxX+kAdjustLength(40), namelabel.maxY, _tableView.width-kAdjustLength(220)-kAdjustLength(100), kAdjustLength(70));
        namelabel1.backgroundColor = [UIColor clearColor];
        namelabel1.font = kFontNormal;
        namelabel1.textColor = kLightTextColor;
        namelabel1.textAlignment = NSTextAlignmentLeft;
        namelabel1.text = @"金牌会员";
        [cell.contentView addSubview:namelabel1];
        
        
        UILabel * line = [[UILabel alloc]initLineWithFrame:CGRectMake(0, kAdjustLength(300)-kLinePixel, _tableView.width, kLinePixel) color:kLineColor];
        [cell.contentView addSubview:line];
    }else if (indexPath.section == 1){
        UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(kAdjustLength(20), 0, kAdjustLength(500), kAdjustLength(150));
    label.backgroundColor = [UIColor clearColor];
    label.font = kFontNormal;
    label.textColor = kDarkTextColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.text = _dataArray[indexPath.row][@"title"];
    [cell.contentView addSubview:label];
        
    UILabel * line = [[UILabel alloc]initLineWithFrame:CGRectMake(0, label.bottom-kLinePixel, _tableView.width, kLinePixel) color:kLineColor];
        [cell.contentView addSubview:line];
    }
    return cell;
}
@end
