//
//  HLLGradientView.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLGradientView.h"

@implementation HLLGradientView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
        CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawLinerGradientWithContext:context];
    [self drawRadialGradientWithContext:context];

}

//渐变
- (void)drawLinerGradientWithContext:(CGContextRef)context{
    //    CGContextSaveGState(context);
    //使用rgb颜色空间
   CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {248.0/255.0,86.0/255.0,86.0/255.0,1,
        249.0/255.0,127.0/255.0,127.0/255.0,1,
        0,1.0,1.0,1.0};
    CGFloat loactions[] = {0, 0.5,1};
    /*
     指定渐变色
     space:颜色空间
     components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
     如果有三个颜色则这个数组有4*3个元素
     locations:颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
     count:渐变个数，等于locations的个数
     */
   CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, loactions, 3);
    /*
     绘制线性渐变
     context:图形上下文
     gradient:渐变色
     startPoint:起始位置
     endPoint:终止位置
     options:绘制方式,DrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制，
     DrawsAfterEndLocation开始位置之前不进行绘制，到结束点之后继续填充
     */
    CGContextDrawLinearGradient(context, gradient, CGPointMake(100, 100), CGPointMake(200, 200), kCGGradientDrawsBeforeStartLocation);
//    CGContextRestoreGState(context);
    
}
- (void)drawRadialGradientWithContext:(CGContextRef)context{
    //使用rgb颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {248.0/255.0,86.0/255.0,86.0/255.0,1,
        249.0/255.0,127.0/255.0,127.0/255.0,1,
        0,1.0,1.0,1.0};
    CGFloat loactions[] = {0, 0.5,1};
    /*
     指定渐变色
     space:颜色空间
     components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
     如果有三个颜色则这个数组有4*3个元素
     locations:颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
     count:渐变个数，等于locations的个数
     */
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, loactions, 3);
    /*
     绘制线性渐变
     context:图形上下文
     gradient:渐变色
     startPoint:起始位置
     startRadius:起始半径（通常为0，否则在此半径范围内容无任何填充）
     endCenter:终点位置（通常和起始点相同，否则会有偏移）
     endRadius:终点半径（也就是渐变的扩散长度）
     options:绘制方式,DrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制，
     DrawsAfterEndLocation开始位置之前不进行绘制，到结束点之后继续填充
     */
    CGContextDrawRadialGradient(context, gradient, CGPointMake(300, 400), 0, CGPointMake(300, 400), 100, kCGGradientDrawsBeforeStartLocation);
}

@end
