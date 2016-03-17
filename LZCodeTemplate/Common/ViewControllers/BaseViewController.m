//
//  BaseViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/1/4.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        if (IOSVersion < 7.0) {
            self.iosChangeFloat = 0;
        }else{
            self.iosChangeFloat = 20;
        }
    }
    
    return self;
}

/** 导航栏 */
- (LZTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
    LZTopBar *tbTop = [[LZTopBar alloc] initWithFrame:frame];
    [tbTop.btnTitle setTitle:@"天天运动" forState:UIControlStateNormal];
    [tbTop setLetfTitle:nil];
    [tbTop.btnLeft addTarget:self action:@selector(onClickTopBar:) forControlEvents:UIControlEventTouchUpInside];
    return tbTop;
}

- (void)loadSubviews
{
    
}

- (void)loadView
{
    [super loadView];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    self.view.backgroundColor = kMainBGColor;
}

//重要：不然有偏移
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _contentView.contentInset = UIEdgeInsetsZero;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.iosChangeFloat + kNavHeight, kScreen_Width, kAdjustLength(1920))];
    bgView.image = [UIImage imageNamed:@"scbg"];
    bgView.contentMode = UIViewContentModeScaleAspectFill;
    bgView.userInteractionEnabled = YES;
    bgView.hidden = YES;
    [self.view addSubview:bgView];
    
    _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.iosChangeFloat + kNavHeight, kScreen_Width, kScreen_Height - (kNavHeight+self.iosChangeFloat)-kTabBarHeight)];
    //    _contentView.backgroundColor = [UIColor clearColor];
    _contentView.scrollEnabled = YES;
    _contentView.showsVerticalScrollIndicator = NO;
    _contentView.showsHorizontalScrollIndicator = NO;
    _contentView.backgroundColor = kMainBGColor;
    [self.view addSubview:_contentView];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - btn method
/** 顶栏点击事件 */
- (void)onClickTopBar:(UIButton *)btn
{
    if (btn.tag == ISTTopBarButtonLeft) {
        
    }
    else if (btn.tag == ISTTopBarButtonRight) {
        
    }
}



@end
