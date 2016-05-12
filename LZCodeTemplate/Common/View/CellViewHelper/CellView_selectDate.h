//
//  CellView_selectDate.h
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/19.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "LZBaseView.h"

@interface CellView_selectDate : LZBaseView
@property (nonatomic,strong)void(^dateBlock)(NSString * startDate ,NSString * endDate );


//时间控件
-(id)initWithFrame:(CGRect)frame  AndShowTitle:(NSString*)title AndDate1:(NSString*)date1 AndDate2:(NSString*)date2 AndBlock:(void(^)(NSString * startDate ,NSString * endDate ))block;

@end
