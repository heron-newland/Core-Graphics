//
//  HLLBezielViewController.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/6.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLBezielViewController.h"
#import "HLLBezielView.h"

@interface HLLBezielViewController ()
@property (nonatomic, weak) HLLBezielView *bezielView;
@end

@implementation HLLBezielViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HLLBezielView *beziel = [[HLLBezielView alloc] init];
    self.bezielView = beziel;
    [self.view addSubview:_bezielView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _bezielView.frame = self.view.bounds;
}


@end
