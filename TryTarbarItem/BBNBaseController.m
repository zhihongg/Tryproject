//
//  BBNBaseController.m
//  Bibenet
//
//  Created by hc on 2017/5/18.
//  Copyright © 2017年 bib. All rights reserved.
//

#import "BBNBaseController.h"

@interface BBNBaseController ()

@end

@implementation BBNBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    // 表示本类支持旋转
    [UIViewController attemptRotationToDeviceOrientation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showInfo:(NSString *)info
{
    CGFloat width = [self getTxtWidth:info fontsize:15];
    
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    CGRect r = [UIScreen mainScreen].bounds;
    UIView *vv = [[UIView alloc]initWithFrame:r];
    vv.backgroundColor = [UIColor clearColor];
    vv.userInteractionEnabled = NO;
    [topWindow addSubview:vv];
    
//    UILabel *label = [UILabel labelWithColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16] textAlignment:NSTextAlignmentCenter numberOfLines:0];
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    
    label.frame = CGRectMake((r.size.width-width)/2, r.size.height-330, width, 50);
    label.backgroundColor = [UIColor blackColor];
    [label.layer setCornerRadius:10];
    [label.layer setMasksToBounds:YES];
    label.text = info;
    [vv addSubview:label];
    
    dispatch_time_t pop_time = dispatch_time(DISPATCH_TIME_NOW, (int)(1 * NSEC_PER_SEC));
    dispatch_after(pop_time, dispatch_get_main_queue(), ^{
        [vv removeFromSuperview];
    });
    
}

- (CGFloat)getTxtHeight:(NSString*)txt fontsize:(CGFloat)fontsize withWidth:(CGFloat)width
{
    UILabel * _m_label_txt = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, width, 80)];
    _m_label_txt.textColor=[UIColor grayColor];
    _m_label_txt.numberOfLines=0;
    _m_label_txt.font=[UIFont systemFontOfSize:fontsize];
    _m_label_txt.backgroundColor=[UIColor whiteColor];
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:txt];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:1];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [txt length])];
    [_m_label_txt setAttributedText:attributedString1];
    [_m_label_txt sizeToFit];
    
    return _m_label_txt.frame.size.height+20;
}

- (CGFloat)getTxtWidth:(NSString*)txt fontsize:(CGFloat)fontsize
{
    UILabel * _m_label_txt = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 25)];
    _m_label_txt.textColor=[UIColor grayColor];
    _m_label_txt.numberOfLines=1;
    _m_label_txt.font=[UIFont systemFontOfSize:fontsize];
    _m_label_txt.backgroundColor=[UIColor whiteColor];
    
    if (txt.length>0) {
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:txt];
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:1];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [txt length])];
        [_m_label_txt setAttributedText:attributedString1];
        [_m_label_txt sizeToFit];
        
        return _m_label_txt.frame.size.width;
    }
    return 0;
}


- (UIColor *)colorFromHexRGB:(NSString *)inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}

@end
