//
//  HLLGradientViewController.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLGradientViewController.h"
#import "HLLGradientView.h"
@interface HLLGradientViewController ()
@property (nonatomic, weak) HLLGradientView *gradientView;
@end

@implementation HLLGradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HLLGradientView *gradient = [[HLLGradientView alloc] init];
    self.gradientView = gradient;
    [self.view addSubview:_gradientView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _gradientView.frame = self.view.bounds;
}

@end
