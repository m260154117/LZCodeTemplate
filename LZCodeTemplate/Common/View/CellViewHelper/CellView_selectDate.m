//
//  CellView_selectDate.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/19.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "CellView_selectDate.h"
#import "UUDatePicker.h"
#import "LZHUDManager.h"
#define kStartDateTag 100
#define kEndDateTag 101
@interface CellView_selectDate ()<UITextFieldDelegate>

@end
@implementation CellView_selectDate{
    
    NSString * _startTime;
    NSString * _endTime;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame  AndShowTitle:(NSString*)title AndDate1:(NSString*)date1 AndDate2:(NSString*)date2 AndBlock:(void(^)(NSString * startDate ,NSString * endDate ))block{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kWhiteColor;
        self.dateBlock = block;
        _startTime = @"";
        _endTime = @"";
        [self configureUIAndTitle:title AndDate1:date1 AndDate2:date2];
    }
    return self;
}
//时间选择器
-(void)configureUIAndTitle:(NSString*)title AndDate1:(NSString*)date1 AndDate2:(NSString*)date2{
    
    
    UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(kAdjustLength(40), 0, 250, kAdjustLength(120))];
    titleLb.textColor = kDarkTextColor;
    titleLb.font = kFontSmall;
    titleLb.backgroundColor = [UIColor clearColor];
    titleLb.text = title;
    [self addSubview:titleLb];
    
    CGFloat itemWidth = (kScreen_Width-2*kAdjustLength(40)-kAdjustLength(90))/2;
    
    
    UIView * startView = [[UIView alloc]initWithFrame:CGRectMake(kAdjustLength(40), titleLb.maxY, itemWidth, kAdjustLength(125))];
    startView.backgroundColor = [UIColor whiteColor];
    startView.layer.cornerRadius = 5.0;
    startView.layer.borderColor = kLineColor.CGColor;
    startView.layer.borderWidth = kLinePixel;
    [self addSubview:startView];
    
    UITextField *startTf = [[UITextField alloc] init];
    startTf.frame = CGRectMake(kAdjustLength(40), 0, itemWidth-kAdjustLength(110), kAdjustLength(125));
    startTf.textColor = kDarkTextColor;
    startTf.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    startTf.textAlignment = NSTextAlignmentLeft;
    startTf.font = kFontSmall;
    startTf.tag = kStartDateTag;
    startTf.delegate = self;
    startTf.text = date1;
    startTf.backgroundColor = [UIColor clearColor];
    [startView addSubview:startTf];
    
    UIImageView *arrow1 = [[UIImageView alloc] initWithFrame:CGRectMake(startView.width - kAdjustLength(100), (startTf.height - kAdjustLength(70))/2, kAdjustLength(70), kAdjustLength(70))];
    arrow1.image = [UIImage imageNamed:@"arrowdown.png"];
    [startView addSubview:arrow1];
    

        UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(startView.maxX, titleLb.maxY, kAdjustLength(90), kAdjustLength(125))];
        lb.text = @"至";
        lb.backgroundColor = [UIColor clearColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.textColor = kLightTextColor;
        lb.font = kFontSmall;
        [self addSubview:lb];
        
        UIView * endView = [[UIView alloc]initWithFrame:CGRectMake(lb.maxX, titleLb.maxY, itemWidth, kAdjustLength(125))];
        endView.backgroundColor = [UIColor whiteColor];
        endView.layer.cornerRadius = 5.0;
        endView.layer.borderColor = kLineColor.CGColor;
        endView.layer.borderWidth = kLinePixel;
        [self addSubview:endView];
        
        UITextField *endTf = [[UITextField alloc] init];
        endTf.frame = CGRectMake(kAdjustLength(40), 0, itemWidth-kAdjustLength(110), kAdjustLength(125));
        endTf.textColor = kDarkTextColor;
        endTf.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        endTf.textAlignment = NSTextAlignmentLeft;
        endTf.font = kFontSmall;
        endTf.tag = kEndDateTag;
        endTf.delegate = self;
        if ([date2 isEqualToString:@""]) {
            endTf.placeholder = @"请选择";
        }else {
            endTf.text = date2;
        }
        [endView addSubview:endTf];
        
        UIImageView *arrow2 = [[UIImageView alloc] initWithFrame:CGRectMake(endView.width - kAdjustLength(100), (endTf.height - kAdjustLength(70))/2, kAdjustLength(70), kAdjustLength(70))];
        arrow2.image = [UIImage imageNamed:@"arrowdown.png"];
        [endView addSubview:arrow2];
    
    UIView *line = [[UIView alloc] initLineWithFrame:CGRectMake(0, self.maxY-kLinePixel, self.width, kLinePixel) color:kLineColor];
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
                                 
                                 if (textField.tag == kStartDateTag) {
                                     _startTime = timeStr;
                                 }
                                 else if (textField.tag == kEndDateTag)
                                 {
                                     _endTime = timeStr;
                                 }
                                 
                             }];
    datePicker.ScrollToDate = date;
    textField.inputView = datePicker;
    
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == kStartDateTag) {
        if (![self isEarlierDate:_startTime withData:_endTime]) {
            [[LZHUDManager defaultManager] showHUDWithInfo:@"开始时间不能晚于结束时间"];
            _startTime = _endTime;
        }
        
        if (_startTime) {
            textField.text =_startTime;
        }
    }
    else if (textField.tag == kEndDateTag)
    {
        if ([self isEarlierDate:_endTime withData:_startTime]) {
            [[LZHUDManager defaultManager] showHUDWithInfo:@"结束时间不能早于开始时间"];
            _endTime = _startTime;
        }
        if (_endTime) {
            textField.text =_endTime;
        }
    }
    
    self.dateBlock(_startTime,_endTime);
    
}

#pragma mark - Date Methods

- (NSString *)getCurrentDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSString *curDateStr = [formatter stringFromDate:[NSDate date]];
    
    return curDateStr;
}

- (NSString *)getPriorDate:(NSInteger)dayBefore
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSTimeInterval nowTimeStamp =  (long)[[NSDate date] timeIntervalSince1970];
    NSTimeInterval beforeTimeStamp = nowTimeStamp - 24*60*60*dayBefore;
    NSDate *beforeDate = [NSDate dateWithTimeIntervalSince1970:beforeTimeStamp];
    NSString *beforeDateStr = [formatter stringFromDate:beforeDate];
    
    return beforeDateStr;
}

- (BOOL)isEarlierDate:(NSString *)curDateStr withData:(NSString *)dateStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate *curDate = [formatter dateFromString:curDateStr];
    NSDate *otherDate = [formatter dateFromString:dateStr];
    
    NSTimeInterval curDateStamp =  (long)[curDate timeIntervalSince1970];
    NSTimeInterval otherDateStamp =  (long)[otherDate timeIntervalSince1970];
    
    BOOL flag = NO;
    if (curDateStamp < otherDateStamp) {
        flag = YES;
    }
    
    return flag;
}


@end
