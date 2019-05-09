//
//  ViewController.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/6.
//  Copyright © 2019 com.heron. All rights reserved.
//
/*
 一般步骤
 
 1、获取绘图上下文
 2、创建并设置路径
 3、将路径添加到上下文
 4、设置上下文状态
 5、绘制路径
 
 参考资料:  http://allluckly.cn/投稿/tuogao29
 */
#import "ViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#import "UIViewController+HLLVC.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *data;
@end

static NSString *const cellId = @"cellId";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    NSArray *components = [self.data[indexPath.row] componentsSeparatedByString:@"-"];
    cell.textLabel.text = components.firstObject;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     NSArray *components = [self.data[indexPath.row] componentsSeparatedByString:@"-"];
    Class class = NSClassFromString(components.lastObject);
    UIViewController *vc = [[class alloc] init];
    vc.name = components.firstObject;
    [self.navigationController pushViewController:vc animated:true];

}
- (NSArray *)data{
    if (!_data) {
        _data = @[@"线条-HLLLineViewController",@"贝塞尔曲线-HLLBezielViewController",@"图形绘制-HLLShapViewController",@"文字-HLLDrawTextViewController",@"图像-HLLDrawImageViewController",@"渐变-HLLGradientViewController",@"叠加-HLLOverlapViewController",@"上下文变化-HLLChangeContextViewController",@"绘制位图-HLLDrawBitMapViewController",@"绘制PDF-HLLDrawPDFViewController"];
    }
    return _data;
}

@end
