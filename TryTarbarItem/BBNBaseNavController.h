//
//  BBNBaseNavController.h
//  Bibenet
//
//  Created by hc on 2017/5/18.
//  Copyright © 2017年 bib. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBNBaseNavController : UINavigationController

//旋转方向 默认竖屏
@property (nonatomic , assign) UIInterfaceOrientation interfaceOrientation;
@property (nonatomic , assign) UIInterfaceOrientationMask interfaceOrientationMask;

@end
