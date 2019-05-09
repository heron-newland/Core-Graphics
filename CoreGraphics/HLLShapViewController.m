//
//  HLLShapViewController.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/6.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLShapViewController.h"
#import "HLLShapView.h"
@interface HLLShapViewController ()
@property (nonatomic, strong) HLLShapView *shapView;
@end

@implementation HLLShapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HLLShapView *shap = [[HLLShapView alloc] init];
    self.shapView = shap;
    [self.view addSubview:_shapView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _shapView.frame = self.view.bounds;
}


@end
