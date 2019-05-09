//
//  HLLShapView.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/6.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLShapView.h"
@interface HLLShapView()

/**
 缩放的图标
 */
@property (nonatomic, strong) UIImageView *xyscale;

/**
 手指一定缩放的当前位置
 */
@property (nonatomic, assign) CGPoint currentlocation;
@property (nonatomic, assign) CGPoint originLocation;
@property (nonatomic, assign) CGPoint delta;
@end
@implementation HLLShapView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.xyscale];
        self.originLocation = CGPointMake(100, 200);
        self.currentlocation = CGPointMake(300, 400);
       
        self.backgroundColor = UIColor.whiteColor;
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self.xyscale addGestureRecognizer:pan];
        
        
        UIPanGestureRecognizer *move = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveAction:)];
        [self addGestureRecognizer:move];
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
     self.xyscale.frame = CGRectMake(self.currentlocation.x, self.currentlocation.y , 40, 40);
}
-(void)moveAction:(UIPanGestureRecognizer *)gesture{
    CGPoint location = [gesture locationInView:self];
    
    //找到落点判断是否在图形内部
//    if (CGRectContainsPoint(CGRectMake(self.originLocation.x, self.originLocation.y, self.currentlocation.x - self.originLocation.x, self.currentlocation.y - self.originLocation.y), location)) {
        //计算落点和图形起始点的位置差
        switch (gesture.state) {
            case UIGestureRecognizerStateBegan:
    
                break;
                case UIGestureRecognizerStateChanged:

                self.delta = CGPointMake( location.x - self.originLocation.x, location.y - self.originLocation.y);
                self.originLocation = CGPointMake(self.originLocation.x + self.delta.x, self.originLocation.y + self.delta.y);
                self.currentlocation = CGPointMake(self.currentlocation.x + self.delta.x, self.currentlocation.y + self.delta.y);
                [self setNeedsLayout];
                [self setNeedsDisplay];
                break;
            default:
                break;
//        }
    }
}
- (void)panAction:(UIGestureRecognizer *)gesture{
    self.currentlocation = [gesture locationInView:self];
    [self setNeedsLayout];
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawShapWithContext:context];
}

- (void)drawShapWithContext:(CGContextRef)context{
//    CGContextMoveToPoint(context, 10, 100);
    CGContextTranslateCTM(context, self.delta.x, self.delta.y);
    CGContextAddRect(context, CGRectMake(self.originLocation.x, self.originLocation.y, self.currentlocation.x - self.originLocation.x, self.currentlocation.y - self.originLocation.y));
    CGContextSetLineWidth(context, 4);
    [UIColor.blackColor setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    
    
}
- (UIImageView *)xyscale{
    if (!_xyscale) {
        _xyscale = [[UIImageView alloc] init];
        _xyscale.userInteractionEnabled = true;
        _xyscale.image = [UIImage imageNamed:@"xy-scale"];
    }
    return _xyscale;
}
@end
