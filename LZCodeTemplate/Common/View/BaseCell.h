//
//  BaseCell.h
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/1/5.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCell : UITableViewCell
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong )UIButton * iconImageBnt;
-(void)reloadCellWithInfo:(NSDictionary*)info ;
@end


