//
//  ISTTableViewController.h
//  CarLife
//
//  Created by MiaoLizhuang on 16/5/6.
//  Copyright © 2016年 高大鹏. All rights reserved.
//

#import "LZBaseViewController.h"

@interface ISTTableViewController : LZBaseViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
}
-(void)configureUI;
-(void)prepareData;

@end
