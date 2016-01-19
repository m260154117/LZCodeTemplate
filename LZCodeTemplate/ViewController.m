//
//  ViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 15/12/30.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import "ViewController.h"
#import "keyBoardViewController.h"
#import "xmlDataViewController.h"
#import "fitTableViewController.h"
#import "searchPhoneViewController.h"
#import "peopleViewController.h"
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
    
}
-(void)configureUI{
    

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCREENWIDTH, KSCREENHEIGH) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
    
    
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
    switch (indexPath.row) {
        case 0:
        {
            keyBoardViewController * keyBoardVC =[[keyBoardViewController alloc]init];
            [self.navigationController pushViewController:keyBoardVC animated:YES];
        }
            break;
        case 1:
        {
            xmlDataViewController * xmlDataVC =[[xmlDataViewController alloc]init];
            [self.navigationController pushViewController:xmlDataVC animated:YES];
        }
            break;
        case 2:
        {
            fitTableViewController * cellFitVC =[[fitTableViewController alloc]init];
            [self.navigationController pushViewController:cellFitVC animated:YES];
        }
            break;
        case 3:
        {
            searchPhoneViewController * searchVC =[[searchPhoneViewController alloc]init];
            [self.navigationController pushViewController:searchVC animated:YES];
        }
            break;
        case 4:
        {
            peopleViewController * peopleVC =[[peopleViewController alloc]init];
            [self.navigationController pushViewController:peopleVC animated:YES];
        }
            break;

        default:
            break;
    }


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
