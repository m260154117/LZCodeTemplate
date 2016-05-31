//
//  HotSalesViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/17.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "HotSalesViewController.h"

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
}


-(void)prepareData{
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"1" forKey:@"level"];
    [dic setValue:@"开始时间:2015-09-02" forKey:@"starttime"];
    [dic setValue:@"早上跑步" forKey:@"content"];
    [dic setValue:@"#锻炼" forKey:@"kind"];
    
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setValue:@"2" forKey:@"level"];
    [dic1 setValue:@"开始时间:2015-09-03" forKey:@"starttime"];
    [dic1 setValue:@"http://baidu.com" forKey:@"content"];
    [dic1 setValue:@"#旅游" forKey:@"kind"];
    
    _dataArray = [NSMutableArray arrayWithArray:@[dic,dic1]];
    
    
}
-(void)configureUI{
    
   
    self.view.backgroundColor = kMainBGColor;
    
    
     _selectView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 20+kAdjustLength(148))];
    _selectView.backgroundColor = RGBCOLOR(253, 80, 100);
    
    NSArray * titleArray = @[@"待办",@"进行中",@"已办"];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return   kAdjustLength(160);
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    [cell.contentView removeAllSubviews];
    
    UILabel * levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(kAdjustLength(20), kAdjustLength(40), kAdjustLength(160)-2*kAdjustLength(40), kAdjustLength(160)-2*kAdjustLength(40))
                            ];
    if ([_dataArray[indexPath.row][@"level"] integerValue] == 1) {
        levelLabel.backgroundColor = [UIColor redColor];
    }else if ([_dataArray[indexPath.row][@"level"] integerValue] == 2){
        levelLabel.backgroundColor = kOrangeColor;
    }
    levelLabel.clipsToBounds = YES;
    levelLabel.layer.cornerRadius = levelLabel.height/2.0;
    levelLabel.textColor = kWhiteColor;
    levelLabel.font = [UIFont systemFontOfSize:17.0];
    levelLabel.textAlignment = NSTextAlignmentCenter;
    levelLabel.text = _dataArray[indexPath.row][@"level"];
    [cell.contentView addSubview:levelLabel];
    
    UILabel * contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(levelLabel.right+kAdjustLength(20), kAdjustLength(20), kScreen_Width-levelLabel.maxX-kAdjustLength(40), kAdjustLength(50))];
    contentLabel.backgroundColor = [UIColor clearColor];
    contentLabel.textColor = kDarkTextColor;
    contentLabel.font = kFontMiddle;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.text = _dataArray[indexPath.row][@"content"];
    [cell.contentView addSubview:contentLabel];
    
    UILabel * kindLabel = [[UILabel alloc]initWithFrame:CGRectMake(levelLabel.right+kAdjustLength(20), contentLabel.bottom+kAdjustLength(20), kScreen_Width/2.0-levelLabel.maxX-kAdjustLength(20), kAdjustLength(50))];
    kindLabel.backgroundColor = [UIColor clearColor];
    kindLabel.textColor = kGreenColor;
    kindLabel.font = kFontMiddle;
    kindLabel.textAlignment = NSTextAlignmentLeft;
    kindLabel.text = _dataArray[indexPath.row][@"kind"];
    [cell.contentView addSubview:kindLabel];
    
    UILabel * startLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreen_Width/2.0, contentLabel.bottom+kAdjustLength(20), kScreen_Width/2.0-kAdjustLength(120), kAdjustLength(50))];
    startLabel.backgroundColor = [UIColor clearColor];
    startLabel.textColor = kLightTextColor;
    startLabel.font = kFontMiddle;
    startLabel.textAlignment = NSTextAlignmentRight;
    startLabel.text = _dataArray[indexPath.row][@"starttime"];
    [cell.contentView addSubview:startLabel];
    
    UIView *line1 = [[UIView alloc] initLineWithFrame:CGRectMake(kAdjustLength(40), kAdjustLength(160)-kLinePixel, kScreen_Width-kAdjustLength(40), kLinePixel) color:kLineColor];
    [cell.contentView addSubview:line1];
    return cell;
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
