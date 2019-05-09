//
//  HLLImageView.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLImageView.h"

@implementation HLLImageView
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
//    CGContextRef context = UIGraphicsGetCurrentContext();
    UIImage *img = [UIImage imageNamed:@"xy-scale"];
    [img drawInRect:CGRectMake(10, 100, 100, 100)];
}


@end
