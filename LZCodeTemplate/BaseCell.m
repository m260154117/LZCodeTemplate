//
//  BaseCell.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/1/5.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "BaseCell.h"
@implementation BaseCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        [self configureUIAndMulti];
    }
    
    return self;
}


-(void)configureUIAndMulti{
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5,KSCREENWIDTH-60, 0)];
    self.titleLabel.font = [UIFont systemFontOfSize:18.0];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.textColor = [UIColor blackColor];
    [self addSubview:self.titleLabel];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    lineLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:lineLabel];
    
    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(4.5);
        make.height.mas_equalTo(0.5);
    }];
    
    self.iconImageBnt = [UIButton buttonWithType:UIButtonTypeCustom ];
    
    UIImage *  normalImage =[UIImage imageNamed:@"vetting_detail_icon_check2"];
       UIImage* selectImage =[UIImage imageNamed:@"vetting_detail_icon_check3"];
    [self.iconImageBnt setImage:normalImage forState:UIControlStateNormal];
    [self.iconImageBnt setImage:selectImage forState:UIControlStateSelected];
    self.iconImageBnt.backgroundColor = [UIColor clearColor];
    self.iconImageBnt.userInteractionEnabled = NO;
    [self addSubview:self.iconImageBnt];
    [self.iconImageBnt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(5);
        make.right.mas_equalTo(self).offset(-5);
        make.width.mas_equalTo(22);
        make.height.mas_equalTo(22);
    }];
    
}
-(void)reloadCellWithInfo:(NSDictionary*)info{
    
    self.titleLabel.text = info[@"title"];
    [self.titleLabel sizeToFit];
    NSString* isMark = [info objectForKey:@"checked"] ;
    if ([isMark isEqualToString:@"true"]) {
        self.iconImageBnt.selected = YES;
    }else{
        self.iconImageBnt.selected = NO;
    }

   
}

@end
