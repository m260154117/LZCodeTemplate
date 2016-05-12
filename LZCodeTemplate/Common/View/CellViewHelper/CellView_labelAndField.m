//
//  CellView_labelAndField.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/19.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "CellView_labelAndField.h"
#import "LZVerifyCodeButton.h"
#define normalLable_width  80
#define normalTextfield_width self.width-normalLable_width-2*normalSepce
#define normalSepce 20

@interface CellView_labelAndField ()<UITextFieldDelegate>

@end
@implementation CellView_labelAndField

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(id)initWithFrame:(CGRect)frame  AndInfo:(NSDictionary*)info AndBlock:(void(^)(NSString *text))block{
    if (self = [super initWithFrame:frame]) {
        self.textBlock = block;
        self.backgroundColor = kWhiteColor;
        [self configureUIAndInfo:info];
    }
    return self;
}
-(void)configureUIAndInfo:(NSDictionary*)cellInfo{
    UILabel *Lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, normalLable_width, self.height)];
    Lb.backgroundColor = [UIColor clearColor];
    Lb.textColor = kDarkTextColor;
    Lb.font = kFontNormal;
    Lb.text = cellInfo[@"labeltitle"];
    Lb.textAlignment = NSTextAlignmentRight;
    [self addSubview:Lb];
    
    UITextField*  Tf = [[UITextField alloc] init];
    Tf.frame = CGRectMake(normalLable_width+normalSepce, 0, normalTextfield_width, self.height);
    Tf.textColor = kDarkTextColor;
    Tf.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Tf.font = kFontLarge_1;
    Tf.text = cellInfo[@"fieldtext"];
    Tf.delegate = self;
    Tf.placeholder = cellInfo[@"fieldplace"];
    [self addSubview:Tf];
    
    if ([cellInfo[@"isHaveYzm"] integerValue] == 1) {
         Tf.frame = CGRectMake(normalLable_width+normalSepce, 0, normalTextfield_width-kAdjustLength(255), self.height);
        UIColor *yellowColor = RGBCOLOR(243, 155, 8);
        self.YZMbtn = [LZVerifyCodeButton buttonWithType:UIButtonTypeCustom];
        self.YZMbtn.frame =CGRectMake(self.width-normalSepce-kAdjustLength(255), 0 + (self.height-kAdjustLength(100))/2, kAdjustLength(255), kAdjustLength(100));
        self.YZMbtn.color = yellowColor;
        
        [self addSubview:self.YZMbtn];
    }
    
    
    UIView *line = [[UIView alloc] initLineWithFrame:CGRectMake(0, Lb.maxY-kLinePixel, self.width, kLinePixel) color:kLineColor];
    [self addSubview:line];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.textBlock(textField.text);
    
}
@end
