//
//  peopleViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/1/5.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "peopleViewController.h"

@interface peopleViewController ()<UITextFieldDelegate>{
    UITextField * _inputTextField;
    
    NSMutableDictionary * _labelDictionary;
}

@end

@implementation peopleViewController
-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)prepareData{
    _labelDictionary = [[NSMutableDictionary alloc]init];
}
-(void)configureUI{
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    _inputTextField = [[UITextField alloc]initWithFrame:CGRectZero];
    _inputTextField.delegate = self;
    _inputTextField.placeholder = @"请输入身份证号";
    [self.view addSubview:_inputTextField];
    
    [_inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(20+64);
        make.height.mas_equalTo(40);
    }];
    
    UIButton * searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    searchButton.titleLabel.textColor = [UIColor whiteColor];
    searchButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    searchButton.layer.cornerRadius = 5.0;
    searchButton.backgroundColor = [UIColor redColor];
    [searchButton addTarget:self action:@selector(searchEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
    
    [searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_inputTextField.mas_left);
        make.right.mas_equalTo(_inputTextField.mas_right);
        make.top.mas_equalTo(_inputTextField.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
    
    UILabel * cityLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    cityLabel.font = [UIFont systemFontOfSize:15.0];
    cityLabel.text = @"身份证所属地区";
    cityLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:cityLabel];
    [cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(searchButton.mas_bottom).offset(30);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];
    
    UILabel * cityLabel1 = [[UILabel alloc]initWithFrame:CGRectZero];
    cityLabel1.font = [UIFont systemFontOfSize:15.0];
    cityLabel1.backgroundColor = [UIColor redColor];
    [self.view addSubview:cityLabel1];
    [cityLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cityLabel.mas_right).offset(10);
        make.top.mas_equalTo(searchButton.mas_bottom).offset(30);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    [_labelDictionary setObject:cityLabel1 forKey:@"city"];
    
    UILabel * brithLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    brithLabel.font = [UIFont systemFontOfSize:15.0];
    brithLabel.text = @"生日";
    brithLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:brithLabel];
    [brithLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(cityLabel1.mas_bottom).offset(10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];
    
    UILabel * brithLabel1 = [[UILabel alloc]initWithFrame:CGRectZero];
    brithLabel1.font = [UIFont systemFontOfSize:15.0];
    brithLabel1.backgroundColor = [UIColor redColor];
    [self.view addSubview:brithLabel1];
    [brithLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(brithLabel.mas_right).offset(10);
        make.top.mas_equalTo(cityLabel1.mas_bottom).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    [_labelDictionary setObject:brithLabel1 forKey:@"birth"];
    
    UILabel * sexLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    sexLabel.font = [UIFont systemFontOfSize:15.0];
    sexLabel.text = @"性别";
    sexLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:sexLabel];
    [sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(brithLabel1.mas_bottom).offset(10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];
    
    UILabel * sexLabel1 = [[UILabel alloc]initWithFrame:CGRectZero];
    sexLabel1.font = [UIFont systemFontOfSize:15.0];
    sexLabel1.backgroundColor = [UIColor redColor];
    [self.view addSubview:sexLabel1];
    [sexLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sexLabel.mas_right).offset(10);
        make.top.mas_equalTo(brithLabel1.mas_bottom).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    [_labelDictionary setObject:sexLabel1 forKey:@"sex"];
    
}

#pragma mark - Actions
-(void)searchEvent:(UIButton*)sender{
    
    [MobAPI sendRequest:[MOBAIdRequest idcardRequestByCardno:_inputTextField.text]
     
               onResult:^(MOBAResponse *response) {
                   
                   if (response.error)
                       
                   {
                       
                       NSLog(@"request error = %@", response.error);
                       
                   }
                   
                   else
                       
                   {
                       
                       NSLog(@"request success = %@", response.responder);
                       NSDictionary * info = (NSDictionary*)response.responder;
                       UILabel * cityLabel =_labelDictionary[@"city"];
                       cityLabel.text = info[@"area"];
                       UILabel * brithLabel =_labelDictionary[@"birth"];
                       brithLabel.text = info[@"birthday"];
                       UILabel * sexLabel =_labelDictionary[@"sex"];
                       sexLabel.text = info[@"sex"];
                       
                       
                   }
                   
               }];
    
}

@end
