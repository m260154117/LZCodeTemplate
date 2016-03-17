//
//  AppMicro.h
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/1/4.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#ifndef AppMicro_h
#define AppMicro_h

#define kScreen_Width  [UIScreen mainScreen].bounds.size.width
#define KSCREENHEIGH  [UIScreen mainScreen].bounds.size.height

/**服务器主域名设置**/
#define kMainDomain             @"http://gdws.nsenz.com/webapp"
//#define kMainDomain             @"http://11.2.252.233:6666/autolife"
#define kTestMainDomain         @"http://101.201.174.252"

//广告、商城现在在用
#define kWscMainDomain           @"http://gdwsc.nsenz.com"


#define kAdjustLength(x)        kScreen_Width*(x)/1080
/**分割线及边框**/
#define kLinePixel           1
#define  kLineColor          RGBCOLOR(244, 244, 244)
#define kCornerRadius        5.0
#define kBorderWidth         1.0


/**颜色函数和常用颜色**/
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define  kMainBGColor            RGBCOLOR(240,240,240)
#define  kNavBarColor            RGBCOLOR(185,0,16)
#define  kStatusBarColor         RGBCOLOR(185,0,16)
#define  kDarkTextColor          RGBCOLOR(76, 73, 72)
#define  kLightTextColor         RGBCOLOR(137, 137, 137)

#define  kWhiteColor             RGBCOLOR(255, 255, 255)
#define  kLightGreenColor        RGBCOLOR(122, 205, 133)
#define  kDarkGreenColor         RGBCOLOR(55, 166, 76)
#define  kDarkGreenColor1        RGBCOLOR(12, 172, 134)//积分查询的积分颜色
#define  kBlueColor              RGBCOLOR(65, 157, 246)
#define  kGreenColor             RGBCOLOR(52, 208, 97)
#define  kRedColor               RGBCOLOR(203, 47, 31)
#define  kOrangeColor            RGBCOLOR(241, 115, 27)
#define  kLigthRedColor          RGBCOLOR(223, 62, 51)
#define  kDarkRedColor           RGBCOLOR(220, 30, 70)

/**字体字号配置**/
#define kFontHuge               [UIFont systemFontOfSize:27]
#define kFontHuge_b             [UIFont boldSystemFontOfSize:27]
#define kFontSuper              [UIFont systemFontOfSize:20]
#define kFontSuper_b            [UIFont boldSystemFontOfSize:20]
#define kFontLarge_2            [UIFont systemFontOfSize:19]
#define kFontLarge_2_b          [UIFont boldSystemFontOfSize:19]
#define kFontLarge_1            [UIFont systemFontOfSize:15]
#define kFontLarge_1_b          [UIFont boldSystemFontOfSize:15]
#define kFontNormalBold         [UIFont boldSystemFontOfSize:14]
#define kFontNormal             [UIFont systemFontOfSize:14]
#define kFontMiddle             [UIFont systemFontOfSize:13]
#define kFontMiddleBold         [UIFont boldSystemFontOfSize:13]
#define kFontSmall              [UIFont systemFontOfSize:12]
#define kFontSmallBold          [UIFont boldSystemFontOfSize:12]
#define kFontTiny               [UIFont systemFontOfSize:11]
#define kFontTinyBold           [UIFont boldSystemFontOfSize:11]
#define kFontMini               [UIFont systemFontOfSize:10]
#define kFontMiniBold           [UIFont boldSystemFontOfSize:10]
#endif /* AppMicro_h */
