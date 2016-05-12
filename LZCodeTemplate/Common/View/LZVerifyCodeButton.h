//
//  LZVerifyCodeButton.h
//  PointsMall
//
//  Created by 高大鹏 on 15/10/23.
//  Copyright © 2015年 高大鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZVerifyCodeButton;
typedef void (^CodeBlock)(LZVerifyCodeButton *);

@interface LZVerifyCodeButton : UIButton

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) CodeBlock block;
@property (nonatomic, strong) void(^doneBlock)();

- (void)startTimer;
-(void)stopTimer;

@end