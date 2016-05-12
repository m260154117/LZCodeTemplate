//
//  CellView_selecter.h
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/19.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "LZBaseView.h"

@interface CellView_selecter : LZBaseView
@property (nonatomic ,strong) void (^textBlock)(NSString * text);
-(id)initWithFrame:(CGRect)frame  AndInfo:(NSDictionary*)info AndBlock:(void(^)(NSString * text))block;
@end
