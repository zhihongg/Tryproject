//
//  BBNBaseController.h
//  Bibenet
//
//  Created by hc on 2017/5/18.
//  Copyright © 2017年 bib. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBNBaseController : UIViewController

- (CGFloat)getTxtWidth:(NSString*)txt fontsize:(CGFloat)fontsize;
- (CGFloat)getTxtHeight:(NSString*)txt fontsize:(CGFloat)fontsize withWidth:(CGFloat)width;
- (void)showInfo:(NSString *)info;
- (UIColor *)colorFromHexRGB:(NSString *)inColorString;
@end
