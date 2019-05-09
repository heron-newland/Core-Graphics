//
//  HLLLineView.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/6.
//  Copyright © 2019 com.heron. All rights reserved.
//
//绘制直线, 点划线
#import "HLLLineView.h"

@implementation HLLLineView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}
//viewdidload之后调用
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawLineWithContext:context];
    [self drawDashLineWith:context];
}
- (void)drawLineWithContext:(CGContextRef)context{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, self.safeAreaInsets.top);
    CGPathAddLineToPoint(path, nil, self.bounds.size.width, 300);
    CGContextSetLineWidth(context, 8);
    CGContextAddPath(context, path);
    [UIColor.redColor setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    //释放资源
     CGPathRelease(path);
}

/**
 绘制点划线

 @param context <#context description#>
 */
- (void)drawDashLineWith:(CGContextRef)context{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, self.bounds.size.width, self.safeAreaInsets.top);
    CGPathAddLineToPoint(path, nil, 0, 300);
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, 6);
    [UIColor.greenColor setStroke];
    //画10个点, 空20个点, 画30个点,空40个点
    CGFloat length[] = {10,20,30,40};
    //最后一个参数表示取length中几个值来画点划线
    //取值为0:画实线
    //取值为1: 取length的第一个元素10, 然后画10个点, 空10个点,以此循环
    //取值为2: 取length中的前两个元素(10,20), 画10个点, 空20个点,以此循环
    CGContextSetLineDash(context, 0, length, 3);
    CGColorSpaceRef colorSpace =  CGColorSpaceCreateDeviceRGB();
    //components包含四个元素,分别为颜色的 R,G,B,A
    CGFloat components[] = {255,0,255,1};//红色
    CGColorRef color = CGColorCreate(colorSpace, components);
    CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 0.5, color);
    CGContextDrawPath(context, kCGPathStroke);
    //释放资源
    CGColorSpaceRelease(colorSpace);
    CGColorRelease(color);
    CGPathRelease(path);
}



//+(CGColorRef) getColorFromRed:(int)red Green:(int)green Blue:(int)blue Alpha:(int)alpha
//{
//    CGFloat r = (CGFloat) red/255.0;
//    CGFloat g = (CGFloat) green/255.0;
//    CGFloat b = (CGFloat) blue/255.0;
//    CGFloat a = (CGFloat) alpha/255.0;
//    CGFloat components[4] = {r,g,b,a};
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//
//    CGColorRef color = (CGColorRef)[(id)CGColorCreate(colorSpace, components) autorelease];
//    CGColorSpaceRelease(colorSpace);
//
//    return color;
//}
@end
