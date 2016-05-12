//
//  CellView_Button.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/19.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "CellView_Button.h"

#define smallLabel_height kAdjustLength(120)

@interface CellView_Button ()<UITextFieldDelegate>{
    
}

@end


@implementation CellView_Button{
    NSMutableArray *_buttonArray;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



-(id)initWithFrame:(CGRect)frame  AndShowTitle:(NSString*)title AndIndex:(NSInteger)index AndTitleArray:(NSArray*)array AndBlock:(void(^)(NSInteger index))block{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kWhiteColor;
        self.clickBlock = block;
        _buttonArray = [NSMutableArray array];
        [self configureUIAndTitleArray:array AndTitle:title AndIndex:index];
    }
    return self;
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
    UIView *line = [[UIView alloc] initLineWithFrame:CGRectMake(0, self.maxY-kLinePixel, self.width, kLinePixel) color:kLineColor];
    [self addSubview:line];
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


@end
