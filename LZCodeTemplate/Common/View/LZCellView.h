//
//  LZCellView.h
//  CarLife
//
//  Created by MiaoLizhuang on 16/3/15.
//  Copyright © 2016年 高大鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZCellView : UIView
@property (nonatomic ,strong) void (^clickBlock)(NSInteger index);
@property (nonatomic,strong)void(^dateBlock)(NSString * startDate ,NSString * endDate );

//多个按钮
-(id)initWithFrame:(CGRect)frame  AndShowTitle:(NSString*)title AndIndex:(NSInteger)index AndTitleArray:(NSArray*)array AndBlock:(void(^)(NSInteger index))block;

//时间控件
-(id)initWithFrame:(CGRect)frame  AndShowTitle:(NSString*)title AndDate1:(NSString*)date1 AndDate2:(NSString*)date2 AndBlock:(void(^)(NSString * startDate ,NSString * endDate ))block;

//查询结果的cell
-(id)initWithFrame:(CGRect)frame AndInfo:(NSDictionary*)info ;
@end
