//
//  HLLLineViewController.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/6.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLLineViewController.h"
#import "HLLLineView.h"
#import "UIViewController+HLLVC.h"
@interface HLLLineViewController ()
@property (nonatomic, weak) HLLLineView *lineView;
@end

@implementation HLLLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HLLLineView *lineV = [[HLLLineView alloc] init];
    self.lineView = lineV;
    
    [self.view addSubview:_lineView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _lineView.frame = self.view.bounds;
}

@end
