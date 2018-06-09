//
//  YZSegmentItem.m
//  YZSegmentTab
//
//  Created by Lakeside on 2018/6/10.
//  Copyright © 2018 Shin. All rights reserved.
//

#import "YZSegmentItem.h"

@implementation YZSegmentItem

- (instancetype)initWithFrame:(CGRect)frame{
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
            = [UIFont systemFontOfSize:15];
            _titleLabel.textAlignment
            = NSTextAlignmentCenter;
        }
    }
    [self addSubview:_titleLabel];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    
}





@end
