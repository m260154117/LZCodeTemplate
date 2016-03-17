//
//  LZBaseViewController.h
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/1/4.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZTopBar.h"
@interface LZBaseViewController : UIViewController<UIScrollViewDelegate>{
    
    LZTopBar *_tbTop;
    UIScrollView *_contentView;
}

@property (nonatomic, assign) float iosChangeFloat;
-(void)configureUI;
-(void)prepareData;
@end
