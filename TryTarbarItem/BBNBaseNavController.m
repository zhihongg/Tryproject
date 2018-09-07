//
//  BBNBaseNavController.m
//  Bibenet
//
//  Created by hc on 2017/5/18.
//  Copyright © 2017年 bib. All rights reserved.
//

#import "BBNBaseNavController.h"

@interface BBNBaseNavController () <UIGestureRecognizerDelegate>

@end

@implementation BBNBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate =  self;
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //去黑线
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    
}

- (UIInterfaceOrientation)interfaceOrientation {
    if (!_interfaceOrientation) {
        _interfaceOrientation = UIInterfaceOrientationPortrait;
    }
    return _interfaceOrientation;
}

- (UIInterfaceOrientationMask)interfaceOrientationMask {
    if (!_interfaceOrientationMask) {
        _interfaceOrientationMask = UIInterfaceOrientationMaskPortrait;
    }
    return _interfaceOrientationMask;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1 ) {
        return NO;
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
//        UIBarButtonItem *backBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"wo_de_fanhui" imageEdgeInsets:LeftBarButtonItemEdge target:self action:@selector(back)];
//
//        viewController.navigationItem.leftBarButtonItem = backBarButtonItem;
//        viewController.hidesBottomBa rWhenPushed = YES;
        
    }
    [super pushViewController:viewController animated:animated];
    
}

- (void)back {
    [self popViewControllerAnimated:YES];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//    });

}

/// 当前的导航控制器是否可以旋转
-(BOOL)shouldAutorotate{
    
    return YES;
}

//设置支持的屏幕旋转方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return self.interfaceOrientationMask;
}

//设置presentation方式展示的屏幕方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
    return self.interfaceOrientation;
}

@end
