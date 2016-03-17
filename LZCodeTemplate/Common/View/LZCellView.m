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
    
    NSMutableArray * _buttonArray;
    
    NSString * _startTime;
    NSString * _endTime;
}


-(id)initWithFrame:(CGRect)frame  AndShowTitle:(NSString*)title AndIndex:(NSInteger)index AndTitleArray:(NSArray*)array AndBlock:(void(^)(NSInteger index))block{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kWhiteColor;
        self.clickBlock = block;
        _buttonArray = [NSMutableArray array];
        [self configureUIAndTitleArray:array AndTitle:title AndIndex:index];
    }
    return self;
}
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

//多个button
-(void)configureUIAndTitleArray:(NSArray*)titltArr AndTitle:(NSString*)title AndIndex:(NSInteger)index{
    
    
    UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(kAdjustLength(40), 0, 250, kAdjustLength(120))];
    titleLb.textColor = kDarkTextColor;
    titleLb.font = kFontSmall;
    titleLb.backgroundColor = [UIColor clearColor];
    titleLb.text = title;
    [self addSubview:titleLb];
    
    float width = (self.width - (titltArr.count-1)*kAdjustLength(20)-2*kAdjustLength(40))/titltArr.count;
    for (int i = 0; i < titltArr.count; i ++) {
        UIButton *kindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        kindBtn.frame = CGRectMake(kAdjustLength(40) + (width + kAdjustLength(20))*i, titleLb.maxY, width, kAdjustLength(120));
        [kindBtn setTitle:titltArr[i] forState:UIControlStateNormal];
        [kindBtn setTitleColor:kLightTextColor forState:UIControlStateNormal];
        kindBtn.titleLabel.font = kFontSmall;
        kindBtn.layer.cornerRadius = kCornerRadius;
        kindBtn.layer.masksToBounds = YES;
        kindBtn.layer.borderColor = kLineColor.CGColor;
        kindBtn.layer.borderWidth = kLinePixel;
        kindBtn.tag = i;
        [_buttonArray addObject:kindBtn];
        [kindBtn addTarget:self action:@selector(kindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:kindBtn];
    }
    
    //默认选中第几个
    if (index <_buttonArray.count) {
        UIButton * tempBnt = _buttonArray[index];
        [self kindBtnClick:tempBnt];
    }
   

}

-(void)kindBtnClick:(UIButton*)sender{
    
    
    for (UIButton * bnt in _buttonArray) {
         [bnt setTitleColor:kLightTextColor forState:UIControlStateNormal];
         bnt.layer.borderColor = kLineColor.CGColor;
    }
    
    [sender setTitleColor:kOrangeColor forState:UIControlStateNormal];
    sender.layer.borderColor = kOrangeColor.CGColor;
    
    self.clickBlock(sender.tag);
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
