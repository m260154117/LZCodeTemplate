//
//  CellView_selecter.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/19.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "CellView_selecter.h"
#import "UUDatePicker.h"
#define normalLable_width  80
#define normalTextfield_width self.width-normalLable_width-2*normalSepce
#define normalSepce 20
@interface CellView_selecter ()<UITextFieldDelegate>

@end





@implementation CellView_selecter

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
   CGFloat  itemWidth = (kScreen_Width-2*kAdjustLength(40)-normalLable_width);
    UIView * startView = [[UIView alloc]initWithFrame:CGRectMake(normalLable_width+normalSepce, kAdjustLength(20), itemWidth, self.height-kAdjustLength(20)*2)];
    startView.backgroundColor = [UIColor whiteColor];
    startView.layer.cornerRadius = 5.0;
    startView.layer.borderColor = kLineColor.CGColor;
    startView.layer.borderWidth = kLinePixel;
    [self addSubview:startView];
    
    UITextField *startTf = [[UITextField alloc] init];
    startTf.frame = CGRectMake(kAdjustLength(20), 0, itemWidth-kAdjustLength(20)-kAdjustLength(110), startView.height);
    startTf.textColor = kDarkTextColor;
    startTf.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    startTf.textAlignment = NSTextAlignmentLeft;
    startTf.font = kFontSmall;
    startTf.delegate = self;
    startTf.text = cellInfo[@"fieldtext"];
    startTf.placeholder = cellInfo[@"fieldplace"];
    startTf.backgroundColor = [UIColor clearColor];
    [startView addSubview:startTf];
    
    UIImageView *arrow1 = [[UIImageView alloc] initWithFrame:CGRectMake(startView.width - kAdjustLength(100), (startTf.height - kAdjustLength(70))/2, kAdjustLength(70), kAdjustLength(70))];
    arrow1.image = [UIImage imageNamed:@"arrowdown.png"];
    [startView addSubview:arrow1];

    
       
    UIView *line = [[UIView alloc] initLineWithFrame:CGRectMake(0, Lb.maxY-kLinePixel, self.width, kLinePixel) color:kLineColor];
    [self addSubview:line];
}

#pragma mark - UITextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate* date = [formatter dateFromString:textField.text];
    UUDatePicker *datePicker
    = [[UUDatePicker alloc]initWithframe:CGRectMake(0, self.width - 200, kScreen_Width, 216)
                             PickerStyle:UUDateStyle_YearMonthDay
                             didSelected:^(NSString *year,
                                           NSString *month,
                                           NSString *day,
                                           NSString *hour,
                                           NSString *minute,
                                           NSString *weekDay) {
                                 
                                 NSString* timeStr = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
                                 
                                 
                             }];
    datePicker.ScrollToDate = date;
    textField.inputView = datePicker;
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
       self.textBlock(textField.text);
    
}

@end
