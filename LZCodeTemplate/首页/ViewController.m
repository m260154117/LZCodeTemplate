//
//  ViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 15/12/30.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import "ViewController.h"
#import "BaseCell.h"
#define CELL_HEIGHT  40
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView * _tableView;
    NSArray * _titleArray;
   
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self prepareData];
    [self configureUI];
    
}



- (LZTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
    _tbTop = [[LZTopBar alloc] initWithFrame:frame];
    [_tbTop.btnTitle setTitle:@"首页" forState:UIControlStateNormal];
    
    
    return _tbTop;
}

-(void)configureUI{

    self.navigationController.navigationBar.hidden = YES;
        _tbTop = [self creatTopBarView:kTopFrame];
        [self.view addSubview:_tbTop];
    
    _contentView.height += kTabBarHeight;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    [_contentView addSubview:_tableView];

}

-(void)prepareData{



    _titleArray=@[@"键盘",@"xml解析",@"cell的自适应",@"手机号查询",@"身份证件查询"];
    
    
   
}



#pragma mark - tableViewDataSourceDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   

    static NSString *reuse=@"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse] ;
    }
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;

}


#pragma mark -tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return CELL_HEIGHT;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
