//
//  HLLDrawPDFViewController.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/9.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLDrawPDFViewController.h"
#import "HLLDrawPDFView.h"
@interface HLLDrawPDFViewController ()
@property (nonatomic, weak) HLLDrawPDFView *pdfView;
@end

@implementation HLLDrawPDFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HLLDrawPDFView *over = [[HLLDrawPDFView alloc] init];
    self.pdfView = over;
    [self.view addSubview:_pdfView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _pdfView.frame = self.view.bounds;
}


@end
