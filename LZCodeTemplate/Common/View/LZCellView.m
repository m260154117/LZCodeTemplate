//
//  LZCellView.m
//  CarLife
//
//  Created by MiaoLizhuang on 16/3/15.
//  Copyright © 2016年 高大鹏. All rights reserved.
//

#import "LZCellView.h"
#import "UUDatePicker.h"
#import "LZHUDManager.h"
#define kStartDateTag 100
#define kEndDateTag 101
@interface LZCellView ()<UITextFieldDelegate>

@end

@implementation LZCellView{
    
   
}



-(id)initWithFrame:(CGRect)frame AndInfo:(NSDictionary *)info {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kWhiteColor;
         [self configureUIAndInfo:info];
    }
    return self;
}

//双行标题
-(void)configureUIAndInfo:(NSDictionary*)info{
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, (kAdjustLength(170)-40)/2.0, kScreen_Width-10-kAdjustLength(200)-10, 20)];
    label.backgroundColor = [UIColor clearColor];
    label.font = kFontSmall;
    label.text = info[@"title"];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = kDarkTextColor;
    label.backgroundColor = [UIColor clearColor];
    [self addSubview:label];
    
    
    
   UILabel * dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, label.bottom, kAdjustLength(300), 20)];
    dateLabel.backgroundColor = [UIColor clearColor];
    dateLabel.font = kFontTiny;
    dateLabel.text = @"date";
    dateLabel.textAlignment = NSTextAlignmentLeft;
    dateLabel.textColor = kLightTextColor;
    dateLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:dateLabel];
    
    
  UILabel*  moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreen_Width-10-kAdjustLength(200), label.minY, kAdjustLength(200), 20)];
    
    moneyLabel.backgroundColor = [UIColor clearColor];
    moneyLabel.font = kFontTinyBold;
    moneyLabel.text = info[@"money"];
    moneyLabel.textAlignment = NSTextAlignmentRight;
    moneyLabel.textColor = kLightTextColor;
    [self addSubview:moneyLabel];
    
   UILabel * statusLabel = [[UILabel alloc]initWithFrame:CGRectMake(10+kAdjustLength(300), label.bottom, kScreen_Width-10-kAdjustLength(300)-10, 20)];
    statusLabel.backgroundColor = [UIColor clearColor];
    statusLabel.font = kFontTiny;
    statusLabel.text = @"status";
    statusLabel.textAlignment = NSTextAlignmentRight;
    statusLabel.textColor = kLightTextColor;
    statusLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:statusLabel];
    
    UIView *line = [[UIView alloc] initLineWithFrame:CGRectMake(10, kAdjustLength(170)-kLinePixel, kScreen_Width-20, kLinePixel) color:kLineColor];
    [self addSubview:line];
    
}



@end
