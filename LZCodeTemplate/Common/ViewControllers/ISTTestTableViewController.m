//
//  ISTTestTableViewController.m
//  CarLife
//
//  Created by MiaoLizhuang on 16/5/6.
//  Copyright © 2016年 高大鹏. All rights reserved.
//

#import "ISTTestTableViewController.h"

@implementation ISTTestTableViewController

/*
 这是一个Demo，因为tableview会经常被使用，说以新建了一个有tableview的基类，
 这个Demo简单的说明了这个基类怎样使用
 */

-(void)viewDidLoad{
    [super viewDidLoad];
}

- (LZTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
    LZTopBar *tbTop = [[LZTopBar alloc] initWithFrame:frame];
    [tbTop.btnTitle setTitle:@"Demo" forState:UIControlStateNormal];
    
    [tbTop setLetfTitle:nil];
    [tbTop.btnLeft addTarget:self action:@selector(onClickTopBar:) forControlEvents:UIControlEventTouchUpInside];
    
    return tbTop;
}

-(void)configureUI{
    [super configureUI];
    UIView * headerView = [[UIView alloc]init];
    headerView.frame = CGRectMake(0, 0, _contentView.width, kAdjustLength(150));
    headerView.backgroundColor = kWhiteColor;
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(kAdjustLength(10), 0, kAdjustLength(250), kAdjustLength(120));
    label.backgroundColor = [UIColor clearColor];
    label.font = kFontNormal;
    label.textColor = kLightTextColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.text = @"主卡卡号:";
    [headerView addSubview:label];
    
    UILabel * label1 = [[UILabel alloc]init];
    label1.frame = CGRectMake(label.maxX+ kAdjustLength(20), 0, headerView.width-label.maxX-kAdjustLength(30), kAdjustLength(120));
    label1.backgroundColor = [UIColor clearColor];
    label1.font = kFontNormal;
    label1.textColor = kLightTextColor;
    label1.textAlignment = NSTextAlignmentLeft;
    label1.text = @"123456789";
    [headerView addSubview:label1];
    
    UILabel * line = [[UILabel alloc]init];
    line.frame = CGRectMake(0, label1.maxY, headerView.width, kAdjustLength(30));
    line.backgroundColor = kLineColor;
    [headerView addSubview:line];
    _tableView.tableHeaderView = headerView;
}
-(void)prepareData{
    [super prepareData];
    NSDictionary * dic = @{@"title":@"标题",@"subtitle":@"这是一个Demo"};
    [_dataArray addObject:dic];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell.contentView removeAllSubviews];
    
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(kAdjustLength(10), 0, kAdjustLength(250), kAdjustLength(150));
    label.backgroundColor = [UIColor clearColor];
    label.font = kFontNormal;
    label.textColor = kDarkTextColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.text = _dataArray[indexPath.row][@"title"];
    [cell.contentView addSubview:label];
    
    UILabel * label1 = [[UILabel alloc]init];
    label1.frame = CGRectMake(label.maxX+ kAdjustLength(20), 0, _tableView.width-label.maxX-kAdjustLength(30), kAdjustLength(150));
    label1.backgroundColor = [UIColor clearColor];
    label1.font = kFontNormal;
    label1.textColor = kLightTextColor;
    label1.textAlignment = NSTextAlignmentLeft;
    label1.text = _dataArray[indexPath.row][@"subtitle"];
    [cell.contentView addSubview:label1];
    
    return cell;
    

}

@end
