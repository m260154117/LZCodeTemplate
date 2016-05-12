//
//  HomeViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/17.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "HomeViewController.h"
#import "CellView_Button.h"
#import "CellView_selectDate.h"
#import "CellView_labelAndField.h"
#import "LZVerifyCodeButton.h"
#import "CellView_selecter.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HomeViewController
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
    
    NSString * _startTime;
    NSString * _endTime;
    
    NSInteger _buttonIndex;
    
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self prepareData];
    [self configureUI];
   
    
}

-(void)prepareData{
    
    _startTime = @"2013-09-23";
    _endTime = @"";
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"身份证" forKey:@"labeltitle"];
    [dic setValue:@"" forKey:@"fieldtext"];
    [dic setValue:@"请填入身份证号" forKey:@"fieldplace"];
    [dic setValue:@"1" forKey:@"isHaveYzm"];
    
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setValue:@"证件类型" forKey:@"labeltitle"];
    [dic1 setValue:@"" forKey:@"fieldtext"];
    [dic1 setValue:@"请填入身份证号" forKey:@"fieldplace"];

    _dataArray = [NSMutableArray arrayWithArray:@[@"",@"",dic,dic1]];
    _buttonIndex = 0;
}

-(void)configureUI{
    _tbTop = [self creatTopBarView:kTopFrame];
    self.view.backgroundColor = kMainBGColor;
    [self.view addSubview:_tbTop];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, _contentView.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor whiteColor];
    [_contentView addSubview:_tableView];

    
  
    
}


- (LZTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
    LZTopBar *tbTop = [[LZTopBar alloc] initWithFrame:frame];
    [tbTop.btnTitle setTitle:@"首页" forState:UIControlStateNormal];
    
    
    return tbTop;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0 || indexPath.row ==1) {
        return kAdjustLength(270);
    }else{
        return kAdjustLength(170);
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell.contentView removeAllSubviews];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    if (indexPath.row ==0) {
        CellView_selectDate * view = [[CellView_selectDate alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kAdjustLength(270)) AndShowTitle:@"选择日期" AndDate1:_startTime AndDate2:_endTime AndBlock:^(NSString *startDate, NSString *endDate) {
            _startTime = startDate;
            _endTime = endDate;
            NSLog(@"%@==%@",_startTime,_endTime);
           
        }];
         [cell.contentView addSubview:view];
    }else if(indexPath.row ==1){
        
        CellView_Button * button = [[CellView_Button alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kAdjustLength(270)) AndShowTitle:@"选择类型" AndIndex:_buttonIndex AndTitleArray:@[@"全部",@"团款积分",@"全部积分",@"申请"] AndBlock:^(NSInteger index) {
            NSLog(@"%ld",(long)index);
            _buttonIndex = index;
        }];
        [cell.contentView addSubview:button];
    }else if (indexPath.row ==2){
        CellView_labelAndField * tf = [[CellView_labelAndField alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kAdjustLength(170) )AndInfo:_dataArray[indexPath.row] AndBlock:^(NSString *text) {
          NSMutableDictionary * tempDic=  _dataArray[indexPath.row];
            [tempDic setValue:text forKey:@"fieldtext"];
            
        }];
        [tf.YZMbtn setBlock:^(LZVerifyCodeButton *button){

        }];

        [cell.contentView addSubview:tf];
        
    }else if (indexPath.row ==3){
        CellView_selecter * tf1 = [[CellView_selecter alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kAdjustLength(170) )AndInfo:_dataArray[indexPath.row] AndBlock:^(NSString *text) {
            NSMutableDictionary * tempDic=  _dataArray[indexPath.row];
            [tempDic setValue:text forKey:@"fieldtext"];
            
        }];
         [cell.contentView addSubview:tf1];
    }
    
    return cell;
}

@end
