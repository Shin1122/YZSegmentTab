//
//  YZSegmentItem.m
//  YZSegmentTab
//
//  Created by Lakeside on 2018/6/10.
//  Copyright © 2018 Shin. All rights reserved.
//

#import "YZSegmentItem.h"

@implementation YZSegmentItem

- (instancetype)initWithFrame:(CGRect)frame
                  didSelected:(nonnull Selected)selected{
    
    if (!selected) {
        return nil;
    }
    _didSelected
    = selected;
    self
    = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    if (!_titleLabel) {
        _titleLabel
        = [[UILabel alloc]initWithFrame:self.bounds];
        {
            _titleLabel.font
            = [UIFont systemFontOfSize:17];
            _titleLabel.textAlignment
            = NSTextAlignmentCenter;
            
        }
    }
    [self addSubview:_titleLabel];
    
    if (!_tap) {
        _tap
        = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                 action:@selector(didTouched:)];
    }
    self.userInteractionEnabled
    = YES;
    [self addGestureRecognizer:_tap];
}

- (void)didLayoutSubviews{
    if (_titleLabel) {
        _titleLabel.frame
        = self.bounds;
    }
}



- (void)didTouched:(UITapGestureRecognizer *)tap{
    if (_didSelected) {
        _didSelected(self);
    }
}


#pragma mark- SET Method
-(void)setFont:(UIFont *)font{
    _font
    = font;
}

-(void)setSelectedFont:(UIFont *)selectedFont{
    _selectedFont
    = selectedFont;
}

-(void)setText:(NSString *)text{
    _text
    = text;
    if (_titleLabel) {
        _titleLabel.text
        = text;
    }
}

-(void)setBackgroundColor:(UIColor *)backgroundColor{
    _backgroundColor
    = backgroundColor;
}
-(void)setSelectedBackgroundColor:(UIColor *)selectedBackgroundColor{
    _selectedBackgroundColor
    = selectedBackgroundColor;
}
-(void)setTextColor:(UIColor *)textColor{
    _textColor
    = textColor;
}
-(void)setSelectedTextColor:(UIColor *)selectedTextColor{
    _selectedTextColor
    = selectedTextColor;
}

-(void)setSelected:(BOOL)selected{
    _selected
    = selected;
    if (selected) {
        if (_titleLabel) {
            if (_selectedFont) {
                _titleLabel.font
                = _selectedFont;
            }
            if (_selectedBackgroundColor) {
                _titleLabel.backgroundColor
                = _selectedBackgroundColor;
            }
            if (_selectedTextColor) {
                _titleLabel.textColor
                = _selectedTextColor;
            }
        }
    }else{
        if (_titleLabel) {
            if (_font) {
                _titleLabel.font
                = _font;
            }
            if (_backgroundColor) {
                _titleLabel.backgroundColor
                = _backgroundColor;
            }
            if (_textColor) {
                _titleLabel.textColor
                = _textColor;
            }
        }
    }
    
}






@end
