//
//  BBNTabberItem.h
//  TryTarbarItem
//
//  Created by iMac on 2018/8/22.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBNTabberItem : UIView

@property (nonatomic, assign) BOOL selected;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIFont *selectedfont;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *selectedtextColor;

@end
