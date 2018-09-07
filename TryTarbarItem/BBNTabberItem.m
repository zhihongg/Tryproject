//
//  BBNTabberItem.m
//  TryTarbarItem
//
//  Created by iMac on 2018/8/22.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "BBNTabberItem.h"

@interface BBNTabberItem ()

@property (weak, nonatomic) IBOutlet UIImageView *myImgView;
@property (weak, nonatomic) IBOutlet UILabel *myLbl;

@end

@implementation BBNTabberItem
- (instancetype)init {
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BBNTabberItem class]) owner:self options:nil] lastObject];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.myLbl.text = title;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.myImgView.image = image;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.myLbl.font = font;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    [self.myLbl setTextColor:textColor];
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    if (selected) {
        self.myImgView.image = _selectedImage;
        self.myLbl.font = _selectedfont;
        [self.myLbl setTextColor:_selectedtextColor];
    } else {
        self.myImgView.image = _image;
        self.myLbl.font = _font;
        [self.myLbl setTextColor:_textColor];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
