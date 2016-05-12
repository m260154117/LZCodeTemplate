//
//  CellView_Button.h
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/19.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "LZBaseView.h"

@interface CellView_Button : LZBaseView

@property (nonatomic ,strong) void (^clickBlock)(NSInteger index);
//多个按钮
-(id)initWithFrame:(CGRect)frame  AndShowTitle:(NSString*)title AndIndex:(NSInteger)index AndTitleArray:(NSArray*)array AndBlock:(void(^)(NSInteger index))block;
@end
