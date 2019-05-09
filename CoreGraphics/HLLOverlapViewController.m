//
//  HLLOverlapViewController.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLOverlapViewController.h"
#import "HLLOverlap.h"
@interface HLLOverlapViewController ()
@property (nonatomic, weak) HLLOverlap *overlap;
@end

@implementation HLLOverlapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HLLOverlap *over = [[HLLOverlap alloc] init];
    self.overlap = over;
    [self.view addSubview:_overlap];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _overlap.frame = self.view.bounds;
}


@end
