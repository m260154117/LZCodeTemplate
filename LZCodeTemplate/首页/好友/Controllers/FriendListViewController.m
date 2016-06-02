//
//  FriendListViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/5/31.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "FriendListViewController.h"

@interface FriendListViewController ()

@end

@implementation FriendListViewController{
    NSMutableArray * _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tbTop = [self creatTopBarView:kTopFrame];
    _contentView.backgroundColor = kMainBGColor;
    [self.view addSubview:_tbTop];
    
    [self prepareData];
    [self configureUI];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareData{
    _dataArray = [NSMutableArray array];
    
    NSDictionary * dic = @{@"title":@"张三"};
    NSDictionary * dic1 = @{@"title":@"李四"};
    NSDictionary * dic2 = @{@"title":@"王五"};
    
    [_dataArray addObject:dic];
    [_dataArray addObject:dic1];
    [_dataArray addObject:dic2];
}
-(void)configureUI{
    
    UILabel * label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.font = kFontLarge_2;
    label.textColor = kLightTextColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines =0;
    label.text = @"你说这个帖子好笑吗。你说呢大哥，哈哈哈哈";
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:12];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [label.text length])];
    [label setAttributedText:attributedString1];
    
    CGSize titleSize = [label.text boundingRectWithSize:CGSizeMake(kScreen_Width-kAdjustLength(40), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kFontLarge_2,NSParagraphStyleAttributeName:paragraphStyle1} context:nil].size;
    label.frame =CGRectMake(kAdjustLength(20), kAdjustLength(20),kScreen_Width-kAdjustLength(20), titleSize.height);
    [_contentView addSubview:label];
    
    
    NSArray * titleArray = @[@"不好笑",@"好笑"];
    for ( int i=0; i<2; i++) {
        UIButton * bnt = [UIButton buttonWithType:UIButtonTypeCustom];
        bnt.frame = CGRectMake(kAdjustLength(50)+i*(kAdjustLength(200)+_contentView.width-kAdjustLength(100)-kAdjustLength(400)), _contentView.height-kAdjustLength(400), kAdjustLength(200), kAdjustLength(100));
        bnt.backgroundColor = [UIColor whiteColor];
        [bnt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [bnt setTitle:titleArray[i] forState:UIControlStateNormal];
        [_contentView addSubview:bnt];
    }
    
   
    
}

- (LZTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
    LZTopBar *tbTop = [[LZTopBar alloc] initWithFrame:frame];
    [tbTop.btnTitle setTitle:@"审核" forState:UIControlStateNormal];
    
    
    return tbTop;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
