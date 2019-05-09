//
//  HLLChangeContextViewController.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLChangeContextViewController.h"
#import "HLLChangeContext.h"
@interface HLLChangeContextViewController ()
@property (nonatomic, weak) HLLChangeContext *context;
@end

@implementation HLLChangeContextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HLLChangeContext *over = [[HLLChangeContext alloc] init];
    self.context = over;
    [self.view addSubview:_context];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _context.frame = self.view.bounds;
}



@end
