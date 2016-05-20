//
//  LZActivityCell.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/5/13.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "LZActivityCell.h"

@implementation LZActivityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)configureUIWithModel:(LZActivityModel*)model{
    
    
    UIView * bgview = [[UIView alloc]init];
    bgview.frame = CGRectMake(0, 0, kScreen_Width, 0);
    bgview.backgroundColor = kWhiteColor;
    [self.contentView addSubview:bgview];
    
    CGFloat _y=kAdjustLength(20);
    
    UIImageView * icon = [[UIImageView alloc]init];
    icon.backgroundColor = [UIColor clearColor];
    icon.frame = CGRectMake(kAdjustLength(20), _y, kAdjustLength(150), kAdjustLength(150));
    icon.image = [UIImage imageNamed:model.headerImageStr];
    icon.layer.cornerRadius = icon.width/2.0;
    icon.clipsToBounds = YES;
    [bgview addSubview:icon];
    
      UILabel * namelabel = [[UILabel alloc]init];
    namelabel.frame = CGRectMake(icon.right+ kAdjustLength(10),_y, kScreen_Width-kAdjustLength(20)-icon.maxX, kAdjustLength(150));
    namelabel.backgroundColor = [UIColor clearColor];
    namelabel.font = kFontLarge_2;
    namelabel.textColor = kLightTextColor;
    namelabel.textAlignment = NSTextAlignmentLeft;
    namelabel.text = model.username;
    [bgview addSubview:namelabel];
    
    _y += icon.height+kAdjustLength(20);
    
    UILabel * label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.font = kFontLarge_2;
    label.textColor = kLightTextColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines =0;
    label.text = model.content;
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:12];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [label.text length])];
    [label setAttributedText:attributedString1];
    
    CGSize titleSize = [model.content boundingRectWithSize:CGSizeMake(kScreen_Width-kAdjustLength(40), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kFontLarge_2,NSParagraphStyleAttributeName:paragraphStyle1} context:nil].size;
        label.frame =CGRectMake(kAdjustLength(20), _y,kScreen_Width-kAdjustLength(20), titleSize.height);
    [bgview addSubview:label];
    
    _y +=label.height+kAdjustLength(20);
    
    
    NSArray * normalImageArray = @[@"icon_for",@"icon_against",@"button_comment"];
    NSArray * selectedImageArray = @[@"icon_for_active",@"icon_against_active",@"button_comment"];
    CGFloat sep =(kAdjustLength(700)-3*kAdjustLength(170))/(normalImageArray.count+1);
    for (int i=0; i<normalImageArray.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame =CGRectMake(kAdjustLength(20) +(sep+kAdjustLength(170))*i, _y, kAdjustLength(170), kAdjustLength(170));
        [button setImage:[UIImage imageNamed:normalImageArray[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectedImageArray[i]] forState:UIControlStateSelected];
        button.tag = 100+i;
        [button addTarget:self action:@selector(bntClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgview addSubview:button];
    }
   
    _y +=kAdjustLength(170);
    
    bgview.frame = CGRectMake(0, 0, kScreen_Width, _y);
    
}

-(void)bntClick:(UIButton*)sender{
    sender.selected = !sender.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
