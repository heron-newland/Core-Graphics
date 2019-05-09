//
//  HLLBezielView.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/6.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLBezielView.h"

@implementation HLLBezielView

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
        [self drawQuadBezielWithContext:context];
        [self drawTriBezielWithContext:context];
    }

- (void)drawQuadBezielWithContext:(CGContextRef)context{
    CGContextMoveToPoint(context, 10, 200);
    /*
     绘制二次贝塞尔曲线
     c:图形上下文
     cpx:控制点x坐标
     cpy:控制点y坐标
     x:结束点x坐标
     y:结束点y坐标
     */
    CGContextAddQuadCurveToPoint(context, 100, 100, 200, 200);
    [UIColor.redColor setStroke];
     CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 6);
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextSaveGState(context);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 10, 200);
    CGPathAddLineToPoint(path, nil, 100, 100);
    CGPathAddLineToPoint(path, nil, 200, 200);
    CGContextAddPath(context, path);
    [UIColor.lightGrayColor setStroke];
    CGContextSetLineWidth(context, 2);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGFloat length[] = {4};
    CGContextSetLineDash(context, 0, length, 1);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextRestoreGState(context);
    
    //释放资源
    CGPathRelease(path);
}

- (void)drawTriBezielWithContext:(CGContextRef)context{
    CGContextMoveToPoint(context, 10, 500);
    /*绘制三次贝塞尔曲线
     c:图形上下文
     cp1x:第一个控制点x坐标
     cp1y:第一个控制点y坐标
     cp2x:第二个控制点x坐标
     cp2y:第二个控制点y坐标
     x:结束点x坐标
     y:结束点y坐标
     */
    CGContextAddCurveToPoint(context, 80, 200, 300, 600, 200, 500);
    [UIColor.redColor setStroke];
    CGContextSetLineWidth(context, 6);
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextSaveGState(context);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 10, 500);
    CGPathAddLineToPoint(path, nil, 80, 200);
    CGPathMoveToPoint(path, nil, 300, 600);
    CGPathAddLineToPoint(path, nil, 200, 500);
    CGContextAddPath(context, path);
    [UIColor.lightGrayColor setStroke];
    CGContextSetLineWidth(context, 2);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGFloat length[] = {4};
    CGContextSetLineDash(context, 0, length, 1);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextRestoreGState(context);
    //释放资源
    CGPathRelease(path);
}
@end
