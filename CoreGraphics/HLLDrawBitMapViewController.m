//
//  HLLDrawBitMapViewController.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLDrawBitMapViewController.h"
#import "HLLDrawBitMapView.h"
@interface HLLDrawBitMapViewController ()
@property (nonatomic, strong) HLLDrawBitMapView *bitMap;
@property (nonatomic, strong) UIImageView *drawView;
@end

@implementation HLLDrawBitMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithTitle:@"切换绘图方式" style:UIBarButtonItemStylePlain target:self action:@selector(changeStyle)]];
    // Do any additional setup after loading the view.
   self.bitMap = [[HLLDrawBitMapView alloc] init];
    [self.view addSubview:_bitMap];
    
    [self.view addSubview:self.drawView];
}

- (void)changeStyle{
    
    if ([self.view.subviews containsObject:self.bitMap]) {
        [self.bitMap removeFromSuperview];
        [self drawBitMap];
    }else{
        [self.view addSubview:self.bitMap];
        self.drawView.image = nil;
    }
    
    
}

- (void)drawBitMap{
    UIGraphicsBeginImageContext(CGSizeMake(300, 300));

    UIImage *img = [UIImage imageNamed:@"user"];
    [img drawInRect:CGRectMake(0, 0, 300, 300)];
    
    //获取当前上下文(获取上下文只有在drawRect方法 和 开启上下文之后才能获取,比如开启图片向下文:UIGraphicsBeginImageContext)
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 300, 300);
    CGContextSetLineWidth(context, 3);
    //下面两种方式都可以设置strokecolor
//    CGFloat components[] = {1,1,1,1};
//    CGContextSetStrokeColor(context, components);
    [UIColor.redColor setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    NSString *name = @"我的版权";
    [name drawInRect:CGRectMake(0, 0, 300, 300) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];

    UIImage *drawImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.drawView.image = drawImg;
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _bitMap.frame = self.view.bounds;
}
- (UIImageView *)drawView{
    if (!_drawView) {
        _drawView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 400, 400)];
        _drawView.contentMode = UIViewContentModeScaleToFill;
    }
    return _drawView;
}

@end
