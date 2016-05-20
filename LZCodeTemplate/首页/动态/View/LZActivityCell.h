//
//  LZActivityCell.h
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/5/13.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZActivityModel.h"
@interface LZActivityCell : UITableViewCell
-(void)configureUIWithModel:(LZActivityModel*)model;
@end
