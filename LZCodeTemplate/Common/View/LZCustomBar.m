//
//  LZCustomBar.m
//  HMDemo
//
//  Created by Raik on 14-3-17.
//  Copyright (c) 2014年 iShinetech. All rights reserved.
//

#import "LZCustomBar.h"
#import "TabbarItem.h"
#import "UIButton+WebCache.h"
#import "AppDelegate.h"

#define selectedColor  RGBCOLOR(40, 205, 141)
#define normalColor    RGBCOLOR(44, 48, 68)

#define kItemLineTag               110
@implementation LZCustomBar

- (id)initWithFrame:(CGRect)frame withContent:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        // Initialization code
        self.tabbars = [NSMutableArray array];
        self.clipsToBounds = NO;
        
//        UIView *line = [[UIView alloc] initLineWithFrame:CGRectMake(0, 0, self.width, kLinePixel) color:RGBCOLOR(201, 202, 203)];
//        [self addSubview:line];
        
        CGFloat kTabbarItemWidth = kScreen_Width/array.count;
        
        for (int i = 0; i < array.count; i++)
        {
            TabbarItem *tb = array[i];
            
            CGRect btmFrame = CGRectMake(kTabbarItemWidth*i,3* kLinePixel, kTabbarItemWidth, kTabBarHeight -3* kLinePixel);
//            if (tb.highlighted) {
//                btmFrame = CGRectMake(kTabbarItemWidth*i, -kAdjustLength(36), kTabbarItemWidth, kTabBarHeight + kAdjustLength(36));
//            }
            UIButton *barItem = [UIButton buttonWithType:UIButtonTypeCustom];
            barItem.frame = btmFrame;
            barItem.tag = i;
            [barItem addTarget:self action:@selector(tabbarItemAction:) forControlEvents:UIControlEventTouchUpInside];
//            
//            NSURL *url = [NSURL URLWithString:tb.selectImg];
//            UIImage *selectedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
//           
//            NSString *normalStr = tb.unSelectImg;
//            normalStr = [normalStr stringByReplacingOccurrencesOfString:@" " withString:@""];
//            NSURL *url1 = [NSURL URLWithString:normalStr];
//            UIImage *normalImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:url1]];
//            
//            [barItem setImage:normalImage forState:UIControlStateNormal];
//            
//            [barItem setImage:selectedImage forState:UIControlStateSelected];
            //[barItem sd_setImageWithURL:[NSURL URLWithString:tb.unSelectImg] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"Default-icon"]];
            //[barItem sd_setImageWithURL:[NSURL URLWithString:tb.selectImg] forState:UIControlStateSelected placeholderImage:[UIImage imageNamed:@"Default-icon"]];
            [barItem setImage:[UIImage imageNamed:tb.selectImg] forState:UIControlStateSelected];
             [barItem setImage:[UIImage imageNamed:tb.unSelectImg] forState:UIControlStateNormal];
            barItem.imageView.contentMode = UIViewContentModeScaleAspectFit;
            barItem.imageEdgeInsets = [barItem setImageEdgeInsetsFromCenterOffSet:CGVectorMake(0, -10) imageSize:CGSizeMake(kTabbarItemWidth, btmFrame.size.height)];
            barItem.adjustsImageWhenHighlighted = NO;
            barItem.showsTouchWhenHighlighted = NO;
            barItem.imageView.clipsToBounds = NO;
            
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 19, barItem.width, barItem.height-10)];
            titleLabel.text = tb.title;
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.backgroundColor = [UIColor clearColor];
            titleLabel.textColor = kWhiteColor;
            titleLabel.tag = 100;
            titleLabel.font = [UIFont systemFontOfSize:13];
            //headerLabel.text = @"test";
                        [barItem addSubview:titleLabel];
            //line:
            UIView *line = [[UIView alloc] initLineWithFrame:CGRectMake(0, 0, self.width, 1.0) color:kLightTextColor];
            [self addSubview:line];
//            line.hidden = YES;
            line.tag = kItemLineTag;
            
            [self.tabbars addObject:barItem];
            [self addSubview:barItem];
        }
    }
    return self;
}

- (void)dealloc
{
    self.tabbars = nil;
}

- (void)onTabbarItemTouched:(id)sender
{
    for (UIButton * bnt in self.tabbars) {
        UILabel * label = [bnt viewWithTag:100];
        label.textColor =normal;

    }
    
    UIButton *item = (UIButton *)sender;
    UILabel * label = [item viewWithTag:100];
    label.textColor =selectedColor;
    if(_delegate && [_delegate respondsToSelector:@selector(didTabbarViewButtonTouched:)])
    {
        [self.delegate didTabbarViewButtonTouched:item.tag];
    }
}

//TODO:点击事件
- (void)tabbarItemAction:(UIButton *)btn
{
    NSInteger index = btn.tag;
        [self setSelectedIndex:index];
}

- (void)setSelectedIndex:(int)index
{
    _selectedIndex = index;
    if (index < 0 || index > _tabbars.count - 1) {
        return;
    }
    UIButton *item = [_tabbars objectAtIndex:index];
    if(_currentBtn == nil || _currentBtn != item)
    {
        UIView *oldLine = [_currentBtn viewWithTag:kItemLineTag];
        if(oldLine){
            oldLine.hidden = YES;
        }
        UIView *newLine = [item viewWithTag:kItemLineTag];
        if(newLine){
            newLine.hidden = NO;
        }
        
        _currentBtn.selected = NO;
        _currentBtn = item;
        _currentBtn.selected = YES;
        
        [self bringSubviewToFront:item];
        [self onTabbarItemTouched:item];
    }
    else
    {
        
    }
}


@end
