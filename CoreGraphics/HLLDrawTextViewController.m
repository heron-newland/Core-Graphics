//
//  HLLDrawTextViewController.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLDrawTextViewController.h"
#import "HLLTextView.h"
@interface HLLDrawTextViewController ()
@property (nonatomic, weak) HLLTextView *textView;
@end

@implementation HLLDrawTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HLLTextView *text = [[HLLTextView alloc] init];
    self.textView = text;
    [self.view addSubview:_textView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _textView.frame = self.view.bounds;
}

@end
