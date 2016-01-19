//
//  fitTableViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/1/5.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "fitTableViewController.h"
#import "BaseCell.h"
@interface fitTableViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView * _tableView;
    NSArray * _titleArray;
    UIButton * _lastButton;
    BOOL _fristSelect;

}

@end

@implementation fitTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
-(void)configureUI{
    
    
    
    UIButton * bnt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bnt setTitle:@"选择标题" forState:UIControlStateNormal];
    bnt.backgroundColor =[ UIColor redColor];
    [self.view addSubview:bnt];
    [bnt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(100);
    }];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 200, KSCREENWIDTH-40, KSCREENHEIGH-200) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
    
    
}

-(void)prepareData{
    _fristSelect = NO;
_titleArray=@[
              @{
                @"title":@"[习近平2016年首次国内考察赴重庆]习近平总书记4日下午来到重庆果园港考察，听取长江上游航运中心建设、铁路公路水路联运等情况介绍，察看正在作业的集装箱船。听说渝新欧国际铁路沿线国家实现一次报关查验、全线放行，他赞赏“挺好”。看到港口设施齐备，已初具规模，他说：“这里大有希望。",
                @"checked":@"true"
                },
              @{
                  @"title":@"[背景：果园港]近年来，重庆加快水运发展，长江上游航运中心雏形已初步显现。果园港是国家级铁路、公路、水路多式联运综合交通枢纽，是重庆规划布局的现代化港口群中的主枢纽港、重庆建设长江上游航运中心的重要载体，设计年通过能力3000万吨，目前已建成16个5000吨级泊位。",
                  @"checked":@"fause"
                },
              @{
                @"title": @"这是一个测试1",
                @"checked":@"true"
                },
              @{
                  @"title":@"这是一测试2",
                  @"checked":@"fause"
                  }
              
              ];
    
}


#pragma mark - tableViewDataSourceDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseCell *cell=nil;
    static NSString *reuse=@"cell";
    if (cell==nil) {
        cell=[[BaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse] ;
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
        }
    }
    [cell reloadCellWithInfo:_titleArray[indexPath.row]];
    return cell;
    
}


#pragma mark -tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self getCellHeightWithString:_titleArray[indexPath.row][@"title"]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
       if (!_fristSelect) {
        _fristSelect = YES;
        [_titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString * mark = obj[@"checked"];
            if ([mark isEqualToString:@"true"]) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
                BaseCell * cell = [_tableView cellForRowAtIndexPath:indexPath];
                _lastButton = cell.iconImageBnt;
            }
        }];
    }
    BaseCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.iconImageBnt.selected = !cell.iconImageBnt.selected;
    if (_lastButton != nil && _lastButton != cell.iconImageBnt) {
        _lastButton.selected = NO;
    }
    
    _lastButton = cell.iconImageBnt;

}

-(float)getCellHeightWithString:(NSString*)string{
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KSCREENWIDTH-60, 0)];
    label.numberOfLines = 0;
    label.text = string;
    label.font = [UIFont systemFontOfSize:18.0];
    [label sizeToFit];
    
    return label.frame.size.height +10;
    
}

@end
