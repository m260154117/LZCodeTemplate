//
//  CellView_labelAndField.h
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/19.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "LZBaseView.h"
#import "LZVerifyCodeButton.h"
@interface CellView_labelAndField : LZBaseView

@property (nonatomic ,strong) void (^textBlock)(NSString * text);
@property (nonatomic ,strong) LZVerifyCodeButton *YZMbtn;
-(id)initWithFrame:(CGRect)frame  AndInfo:(NSDictionary*)info AndBlock:(void(^)(NSString * text))block;

@end
