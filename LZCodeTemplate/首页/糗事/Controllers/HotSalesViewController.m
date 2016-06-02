//
//  HotSalesViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/17.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "HotSalesViewController.h"
#import "LZActivityModel.h"
#import "LZActivityCell.h"
@interface HotSalesViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HotSalesViewController
{
    
    UITableView * _tableView;
    NSMutableArray * _dataArray;
    UIView * _selectView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self prepareData];
    [self configureUI];
    [self getActivityList];
}


-(void)prepareData{
    
    
    _dataArray = [NSMutableArray arrayWithArray:@[]];
    
    
}
-(void)configureUI{
    
   
    self.view.backgroundColor = kMainBGColor;
    
    
     _selectView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 20+kAdjustLength(148))];
    _selectView.backgroundColor = RGBCOLOR(253, 80, 100);
    
    NSArray * titleArray = @[@"我的糗事",@"我的收藏",@"我的参与"];
    for (int i=0; i<titleArray.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*kScreen_Width/titleArray.count, 30, kScreen_Width/titleArray.count, 34) ;
        btn.backgroundColor = [UIColor clearColor];
        [btn setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        btn.titleLabel.font = kFontLarge_1;
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_selectView addSubview:btn];
    }
    
    UIView * indexView = [[UIView alloc]init];
    indexView.frame = CGRectMake(30, 20+kAdjustLength(128), 67, 2);
    indexView.backgroundColor = kWhiteColor;
    indexView.tag = 200;
    [_selectView addSubview:indexView];
    [self.view addSubview:_selectView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _contentView.width, _contentView.height) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_contentView addSubview:_tableView];
    
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    if (indexPath.row ==0 || indexPath.row ==1) {
    //        return kAdjustLength(270);
    //    }else{
    //        return kAdjustLength(170);
    //    }
    return [self getHeightWithIndex:indexPath.row];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"cellId";
    LZActivityCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[LZActivityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell.contentView removeAllSubviews];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    [cell configureUIWithModel:_dataArray[indexPath.row]];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)getHeightWithIndex:(NSInteger)index{
    
    CGFloat _y = kAdjustLength(20);//起始高度
    _y +=kAdjustLength(150)+kAdjustLength(20);//头像
    
    UILabel * label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.font = kFontLarge_2;
    label.textColor = kLightTextColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines =0;
    LZActivityModel * model = _dataArray[index];
    label.text = model.content;
    
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:10];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [label.text length])];
    [label setAttributedText:attributedString1];
    
    CGSize titleSize = [model.content boundingRectWithSize:CGSizeMake(kScreen_Width-kAdjustLength(40), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kFontLarge_2,NSParagraphStyleAttributeName:paragraphStyle1} context:nil].size;
    
    _y += kAdjustLength(20)+titleSize.height;
    
    _y += kAdjustLength(170);
    
    _y+=kAdjustLength(40);
    
    _y +=(_tableView.width-kAdjustLength(100));
    
    
    NSLog(@"vc%f",_y);
    return _y;
    
}

#pragma mark - requset
-(void)getActivityList{
    
    LZActivityModel * model = [[LZActivityModel alloc]init];
    model.content = @"这是一个测试";
    model.username = @"路人甲";
    model.headerImageStr = @"default_user.jpg";
    [_dataArray addObject:model];
    
    LZActivityModel * model1 = [[LZActivityModel alloc]init];
    model1.content = @"四川新闻客户端记者 袁敏）5月13上午，遂宁(微博)交警在遂宁城区街面巡逻时，发现一辆违停的轿车。交警检查发现，轿车前挡风玻璃还放了一张手写的纸条，“交警叔叔：您好，上楼接病人，耽搁10分钟，请勿抄牌，谢谢！”在留言结尾，车主还留下了联系电话，并画上了一张笑脸";
    model1.username = @"奔跑吧兄弟";
    model1.headerImageStr = @"default_user.jpg";
    [_dataArray addObject:model1];
    
    [_tableView reloadData];
    
    
    
}
#pragma mark - Actions
- (void)onClickTopBar:(UIButton *)btn
{
    if (btn.tag == ISTTopBarButtonLeft) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else if (btn.tag == ISTTopBarButtonLeft) {
        
    }
}

-(void)btnClick:(UIButton*)sender{
    
    UIView * indexView = [_selectView viewWithTag:200];
    [UIView animateWithDuration:0.5 animations:^{
         indexView.frame = CGRectMake((sender.tag-100)*sender.width+30, indexView.origin.y, indexView.width, indexView.height) ;
    }];
   
    
}
-(void)queryBtnClick:(UIButton*)sender{
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
