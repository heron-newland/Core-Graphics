//
//  HLLDrawImageViewController.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "HLLDrawImageViewController.h"
#import "HLLImageView.h"
@interface HLLDrawImageViewController ()
@property (nonatomic, strong) HLLImageView *imageView;
@end

@implementation HLLDrawImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HLLImageView *img = [[HLLImageView alloc] init];
    self.imageView = img;
    [self.view addSubview:_imageView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _imageView.frame = self.view.bounds;
}

@end
