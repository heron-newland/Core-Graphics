//
//  HLLTextView.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLTextView.h"

@implementation HLLTextView
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
    [self drawTextWithContext:UIGraphicsGetCurrentContext()];
}

- (void)drawTextWithContext:(CGContextRef)context{
    //建议使用yytext
    NSString *str = @"hahah你好";
    [str drawAtPoint:CGPointMake(10, 100) withAttributes:nil];
}
@end
