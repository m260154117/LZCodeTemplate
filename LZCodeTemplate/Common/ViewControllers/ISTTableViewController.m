//
//  ISTTableViewController.m
//  CarLife
//
//  Created by MiaoLizhuang on 16/5/6.
//  Copyright © 2016年 高大鹏. All rights reserved.
//

#import "ISTTableViewController.h"

@implementation ISTTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self prepareData];
    [self configureUI];
}

- (LZTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
    LZTopBar *tbTop = [[LZTopBar alloc] initWithFrame:frame];
    [tbTop.btnTitle setTitle:@"" forState:UIControlStateNormal];
    
    [tbTop setLetfTitle:nil];
    [tbTop.btnLeft addTarget:self action:@selector(onClickTopBar:) forControlEvents:UIControlEventTouchUpInside];
    
    return tbTop;
}

-(void)prepareData{
    _dataArray = [NSMutableArray array];
    
}
-(void)configureUI{
    _tbTop = [self creatTopBarView:kTopFrame];
    [self.view addSubview:_tbTop];
    _contentView.height += kTabBarHeight;
    _contentView.backgroundColor = kMainBGColor;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width , _contentView.height ) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc]init];
    [_contentView addSubview:_tableView];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   return  kAdjustLength(150);
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

#pragma mark - Click Menu

- (void)onClickTopBar:(UIButton *)btn
{
    if (btn.tag == ISTTopBarButtonLeft) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (btn.tag == ISTTopBarButtonRight) {
        
    }
}


@end
