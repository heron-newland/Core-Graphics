//
//  HLLOverlap.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLOverlap.h"

@implementation HLLOverlap
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
    CGRect rect0 = CGRectMake(20, 0, 150, self.bounds.size.height);
    
    
    NSMutableArray *arr0 = [NSMutableArray array];
    for (int i = 0; i<28; i++) {
        CGRect rect = CGRectMake(190, self.safeAreaInsets.top + i * 25, 10, 250);
        [arr0 addObject:@(rect)];
    }
    
    NSArray *nameStrs = @[
                          @"kCGBlendModeNormal",
                          @"kCGBlendModeMultiply",
                          @"kCGBlendModeScreen",
                          @"kCGBlendModeOverlay",
                          @"kCGBlendModeDarken",
                          @"kCGBlendModeLighten",
                          @"kCGBlendModeColorDodge",
                          @" kCGBlendModeColorBurn",
                          @"kCGBlendModeSoftLight",
                          @"kCGBlendModeHardLight",
                          @"kCGBlendModeDifference",
                          @"kCGBlendModeExclusion",
                          @"kCGBlendModeHue",
                          @"kCGBlendModeSaturation",
                          @"kCGBlendModeColor",
                          @"kCGBlendModeLuminosity",
                          @"kCGBlendModeClear",
                          @"kCGBlendModeCopy",
                          @"kCGBlendModeSourceIn",
                          @"kCGBlendModeSourceOut",
                          @"kCGBlendModeSourceAtop",
                          @"kCGBlendModeDestinationOver",
                          @"kCGBlendModeDestinationIn",
                          @"kCGBlendModeDestinationOut",
                          @"kCGBlendModeDestinationAtop",
                          @" kCGBlendModeXOR",
                          @"kCGBlendModePlusDarker",
                          @"kCGBlendModePlusLighter"
                          ];
    
    NSMutableArray *arr1 = [NSMutableArray array];
    for (int i = 0; i<28; i++) {
        CGRect rect = CGRectMake(0, self.safeAreaInsets.top + i * 25, 180, 10);
        [arr1 addObject:@(rect)];
    }
    [UIColor.yellowColor set];
    UIRectFill(rect0);
    
    [UIColor.redColor set];
    
    for (int i = 0; i<arr1.count; i++) {
        NSValue *val = arr1[i];
        UIRectFillUsingBlendMode(val.CGRectValue, i);
    }
    for (int i = 0; i<arr0.count; i++) {
        NSValue *val = arr0[i];
        NSString *name = nameStrs[i];
        [name drawAtPoint:val.CGRectValue.origin withAttributes:nil];
    }
    
}



@end
