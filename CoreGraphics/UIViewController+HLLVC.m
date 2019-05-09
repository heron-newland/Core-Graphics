//
//  UIViewController+HLLVC.m
//  CoreGraphics
//
//  Created by  bochb on 2019/5/7.
//  Copyright © 2019 com.heron. All rights reserved.
//

#import "UIViewController+HLLVC.h"
#import <objc/runtime.h>
@implementation UIViewController (HLLVC)
+(void)load{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originSel = @selector(viewDidLoad);
        SEL swizzelSel = @selector(hll_viewDidLoad);
        Method swizzelMethod = class_getInstanceMethod([self class], swizzelSel);
        Method originMethod = class_getInstanceMethod([self class], originSel);
      BOOL didAdd =  class_addMethod([self class], swizzelSel, method_getImplementation(swizzelMethod), method_getTypeEncoding(swizzelMethod));
        if (didAdd) {
            class_replaceMethod([self class], originSel, method_getImplementation(swizzelMethod), method_getTypeEncoding(swizzelMethod));
        }else{
            method_exchangeImplementations(originMethod, swizzelMethod);
        }
    });
}


- (void)hll_viewDidLoad{
    [self hll_viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = self.name;
}
- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, "name", name, OBJC_ASSOCIATION_COPY);
}
- (NSString *)name{
    return  objc_getAssociatedObject(self, "name");
}
@end
