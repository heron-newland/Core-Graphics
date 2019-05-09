//
//  HLLChangeContext.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLChangeContext.h"

@implementation HLLChangeContext
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
    CGContextSaveGState(context);
    [self changeCoordinateWithContext:context];
//    CGContextRestoreGState(context);
    [self rotateWithContext:context];
    
}

- (void)changeCoordinateWithContext:(CGContextRef)context{
    //    CGContextRotateCTM(context, M_PI / 50);
    //Core Graphics坐标原点在左下角, UIKit坐标系在左上角, 所以先把坐标系转换成Core Graphics坐标
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -self.bounds.size.height);

    CGContextDrawImage(context, CGRectMake(0, 0, 100, 100), [UIImage imageNamed:@"user"].CGImage);
}
- (void)rotateWithContext:(CGContextRef)context{
    //缩放
    CGContextScaleCTM(context, 2, 2);
    //平移
    CGContextTranslateCTM(context, 100, 20);
    CGContextDrawImage(context, CGRectMake(0, 100, 100, 100), [UIImage imageNamed:@"user"].CGImage);
}


@end
