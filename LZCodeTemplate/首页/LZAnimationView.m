//
//  LZAnimationView.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/3/22.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "LZAnimationView.h"
#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
@implementation LZAnimationView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIColor * color = [UIColor redColor];
    [color set]; //设置线条颜色
    
//    //创建三角形
//    UIBezierPath * BezierPath = [UIBezierPath bezierPath];
//    BezierPath.lineWidth = 5.0;
//    BezierPath.lineCapStyle = kCGLineCapRound;//线条拐角
//    BezierPath.lineJoinStyle = kCGLineJoinRound;//终点处理
//    
//    [BezierPath moveToPoint:CGPointMake(kScreen_Width/2.0, 100.0)];
//    [BezierPath addLineToPoint:CGPointMake(kScreen_Width/2.0-50, 200.0)];
//    [BezierPath addLineToPoint:CGPointMake(kScreen_Width/2.0+50, 200.0)];
//    [BezierPath closePath];
//    
//    [BezierPath stroke];
//    [BezierPath fill];
    
//    //创建矩形
//    UIBezierPath *BezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(10, 100, kScreen_Width-20, 100)];
//    BezierPath.lineWidth = 5.0;
//    BezierPath.lineCapStyle = kCGLineCapRound;
//    BezierPath.lineJoinStyle = kCGLineJoinRound;
//    [BezierPath stroke];
    
//    //创建椭圆
//    UIBezierPath *BezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 100, kScreen_Width-20, 100)];
//    BezierPath.lineWidth = 5.0;
//    BezierPath.lineCapStyle = kCGLineCapRound;
//    BezierPath.lineJoinStyle = kCGLineJoinRound;
//    [BezierPath stroke];
    
//    //创建弧形
//    UIBezierPath *BezierPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:50.0 startAngle:DEGREES_TO_RADIANS(90) endAngle:DEGREES_TO_RADIANS(270) clockwise:YES];
//    
//    
//        BezierPath.lineWidth = 5.0;
//        BezierPath.lineCapStyle = kCGLineCapRound;
//        BezierPath.lineJoinStyle = kCGLineJoinRound;
//        [BezierPath stroke];
    
        //二阶贝塞尔曲线
        UIBezierPath * BezierPath = [UIBezierPath bezierPath];
        BezierPath.lineWidth = 5.0;
        BezierPath.lineCapStyle = kCGLineCapRound;//线条拐角
        BezierPath.lineJoinStyle = kCGLineJoinRound;//终点处理
        [BezierPath moveToPoint:CGPointMake(10, 100.0)];
   // [BezierPath addQuadCurveToPoint:CGPointMake(kScreen_Width/2.0, 100.0) controlPoint:CGPointMake(50, 50.0) ];
    [BezierPath addCurveToPoint:CGPointMake(kScreen_Width/2.0, 100.0) controlPoint1:CGPointMake(10.0+(kScreen_Width/2.0-10.0)/3.0, 50.0) controlPoint2:CGPointMake(10.0+(kScreen_Width/2.0-10.0)*2.0/3.0, 150.0)];
    [BezierPath addCurveToPoint:CGPointMake(kScreen_Width, 100.0) controlPoint1:CGPointMake(kScreen_Width/2.0+(kScreen_Width/2.0-10.0)/3.0, 50.0) controlPoint2:CGPointMake(kScreen_Width/2.0+(kScreen_Width/2.0-10.0)*2.0/3.0, 150.0)];

 [BezierPath stroke];
    
}


@end
