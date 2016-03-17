//
//  keyBoardViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/1/4.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "keyBoardViewController.h"

@interface keyBoardViewController ()<UITextViewDelegate>{
  UITextView*  _textView;
}

@end

@implementation keyBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)configureUI{
    _textView = [[UITextView alloc]initWithFrame:CGRectZero];
    _textView.delegate = self;
    _textView.backgroundColor = [UIColor redColor];
    [_textView becomeFirstResponder];
    _textView.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(10,10,10,10));
    }];
//    [_textView ]
    
}
-(void)prepareData{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
