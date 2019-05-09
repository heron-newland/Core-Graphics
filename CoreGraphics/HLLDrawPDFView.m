//
//  HLLDrawPDFView.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/9.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLDrawPDFView.h"

@implementation HLLDrawPDFView

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
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1, -1);
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"dgcdhp" ofType:@"pdf"]];
    CFURLRef urlref = (__bridge CFURLRef)url;
    CGPDFDocumentRef pdf =  CGPDFDocumentCreateWithURL(urlref);
    CGPDFPageRef page =  CGPDFDocumentGetPage(pdf, 1);
    CGContextDrawPDFPage(context, page);
}


@end
