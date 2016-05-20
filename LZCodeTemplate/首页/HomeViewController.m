//
//  HomeViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/17.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "HomeViewController.h"
#import "LZActivityCell.h"
#import "LZActivityModel.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
{
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getActivityList];
    
}
- (LZTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
    LZTopBar *tbTop = [[LZTopBar alloc] initWithFrame:frame];
    [tbTop.btnTitle setTitle:@"动态" forState:UIControlStateNormal];
    return tbTop;
}
-(void)prepareData{
    [super prepareData];
    
   }

-(void)configureUI{
    [super configureUI];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _contentView.backgroundColor = kMainBGColor;
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

@end
