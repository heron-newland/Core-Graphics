//
//  HLLDrawBitMapView.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLDrawBitMapView.h"

@implementation HLLDrawBitMapView

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
   [self drawImageWithContext:UIGraphicsGetCurrentContext()];
}

/**
 在上下文中直接绘制图片

 @param context <#context description#>
 */
- (void)drawImageWithContext:(CGContextRef)context{
    UIImage *img = [UIImage imageNamed:@"user"];
    //绘制图片
    CGContextDrawImage(context, CGRectMake(0, 100, 100, 100), img.CGImage);
    //文理贴图
    CGContextDrawTiledImage(context, CGRectMake(0, 0, 100, 100), img.CGImage);
}

@end
