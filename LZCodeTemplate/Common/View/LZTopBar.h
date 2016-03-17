//
//  LZTopBar.h
//  BSports
//
//  Created by 雷克 on 15/1/8.
//  Copyright (c) 2015年 ist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZBaseView.h"

#define kButtonEdgeInsetsLeft               15
#define kBackButtonEdgeInsetsLeft           10

typedef enum {
    ISTTopBarButtonLeft = 1,
    ISTTopBarButtonRight = 2,
    ISTTopBarButtonTitle = 3
} UCTopBarButton;

@interface LZTopBar : LZBaseView

@property (nonatomic, readonly) UIButton *btnTitle;
@property (nonatomic, readonly) UIButton *btnLeft;
@property (nonatomic, strong) UIButton *btnRight;

- (void)setLetfTitle:(NSString *)title;
- (void)setRightTitle:(NSString *)title;
@end
