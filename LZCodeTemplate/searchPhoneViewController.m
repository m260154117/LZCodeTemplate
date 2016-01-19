//
//  searchPhoneViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/1/5.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "searchPhoneViewController.h"

@interface searchPhoneViewController ()<UITextFieldDelegate>{
    
    UITextField * _inputTextField;
    
    NSMutableDictionary * _labelDictionary;
}

@end

@implementation searchPhoneViewController

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
    _inputTextField.placeholder = @"请输入手机号";
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
    
    UILabel * phoneLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    phoneLabel.font = [UIFont systemFontOfSize:15.0];
    phoneLabel.text = @"手机号码";
    phoneLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(searchButton.mas_bottom).offset(30);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];
    
    UILabel * phoneLabel1 = [[UILabel alloc]initWithFrame:CGRectZero];
    phoneLabel1.font = [UIFont systemFontOfSize:15.0];
    phoneLabel1.backgroundColor = [UIColor redColor];
    [self.view addSubview:phoneLabel1];
    [phoneLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(phoneLabel.mas_right).offset(10);
        make.top.mas_equalTo(searchButton.mas_bottom).offset(30);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    [_labelDictionary setObject:phoneLabel1 forKey:@"phone"];
    
    UILabel * cityLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    cityLabel.font = [UIFont systemFontOfSize:15.0];
    cityLabel.text = @"归属地";
    cityLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:cityLabel];
    [cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(phoneLabel1.mas_bottom).offset(10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];
    
    UILabel * cityLabel1 = [[UILabel alloc]initWithFrame:CGRectZero];
    cityLabel1.font = [UIFont systemFontOfSize:15.0];
    cityLabel1.backgroundColor = [UIColor redColor];
    [self.view addSubview:cityLabel1];
    [cityLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cityLabel.mas_right).offset(10);
        make.top.mas_equalTo(phoneLabel1.mas_bottom).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    [_labelDictionary setObject:cityLabel1 forKey:@"city"];
    
    UILabel * mobLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    mobLabel.font = [UIFont systemFontOfSize:15.0];
    mobLabel.text = @"运营商";
    mobLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:mobLabel];
    [mobLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(cityLabel1.mas_bottom).offset(10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];
    
    UILabel * mobLabel1 = [[UILabel alloc]initWithFrame:CGRectZero];
    mobLabel1.font = [UIFont systemFontOfSize:15.0];
    mobLabel1.backgroundColor = [UIColor redColor];
    [self.view addSubview:mobLabel1];
    [mobLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mobLabel.mas_right).offset(10);
        make.top.mas_equalTo(cityLabel1.mas_bottom).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    [_labelDictionary setObject:mobLabel1 forKey:@"mob"];
    
}

#pragma mark - Actions
-(void)searchEvent:(UIButton*)sender{
    
    [MobAPI sendRequest:[MOBAPhoneRequest ownershipRequestByPhone:_inputTextField.text]
     
               onResult:^(MOBAResponse *response) {
                   
                   if (response.error)
                       
                   {
                       
                       NSLog(@"request error = %@", response.error);
                       
                   }
                   
                   else
                       
                   {
                       
                       NSLog(@"request success = %@", response.responder);
                       NSDictionary * info = (NSDictionary*)response.responder;
                       UILabel * phoneLabel =_labelDictionary[@"phone"];
                       phoneLabel.text = info[@"mobileNumber"];
                       UILabel * cityLabel =_labelDictionary[@"city"];
                       cityLabel.text = info[@"city"];
                       UILabel * mobLabel =_labelDictionary[@"mob"];
                       mobLabel.text = info[@"operator"];
                       
                       
                   }
                   
               }];

}

@end
