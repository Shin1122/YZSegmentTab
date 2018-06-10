//
//  YZSegment.m
//  YZSegmentTab
//
//  Created by Lakeside on 2018/6/10.
//  Copyright © 2018 Shin. All rights reserved.
//

#import "YZSegment.h"
#import "YZSegmentItem.h"

@interface YZSegment ()
<UIScrollViewDelegate>{
    
}

@property (nonatomic, strong) UIScrollView *scrollContentView ;
@property (nonatomic, strong) NSMutableArray <YZSegmentItem *>*itemsArray ;
@property (nonatomic, strong) UIImageView *indicator ;

@end

@implementation YZSegment

-(instancetype)initWithTitles:(NSArray<NSString *> *)titles{
    if (!titles) {
        return nil;
    }
    _titles
    = titles;
    
    self
    = [super init];
    if (self) {
        
        [self didSetProperties];
        [self setupViews];
        [self didLayoutSubviews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
                      titles:(NSArray<NSString *> *)titles{
    if (!titles) {
        return nil;
    }
    _titles
    = titles;
    
    self
    = [super initWithFrame:frame];
    if (self) {
        
        [self didSetProperties];
        [self setupViews];
        [self didLayoutSubviews];
    }
    return self;
    
}


- (void)didSetProperties{
    
    _horizonMargin
    = 0;
    _itemsArray
    = @[].mutableCopy;
    
    ///@test
    _titles
    = @[
        @"新闻",
        @"推荐",
        @"要闻",
        @"综合",
        @"体育",
        @"金融",
        @"经济",
        @"房产",
        @"军事",
        @"美妆",
        @"小视频",
        ];
    
}

- (void)setupViews{
    
    if (!_scrollContentView) {
        _scrollContentView
        = [[UIScrollView alloc]initWithFrame:[self didCreatScrollContentViewFrame]];
        {
            _scrollContentView.delegate
            = self;
            _scrollContentView.showsVerticalScrollIndicator
            = NO;
            _scrollContentView.showsHorizontalScrollIndicator
            = NO;
        }
    }
    [self addSubview:_scrollContentView];
    
    if (!_indicator) {
        _indicator
        = [[UIImageView alloc]init];
    }
    [self addSubview:_indicator];
    
    if (_titles
        &&_titles.count > 0) {
        
        typeof(self) __weak weakSelf = self;
        [_titles enumerateObjectsUsingBlock:
         ^(NSString * _Nonnull obj,
           NSUInteger idx,
           BOOL * _Nonnull stop) {
             
             YZSegmentItem *item
             = [[YZSegmentItem alloc]initWithFrame:CGRectZero
                                       didSelected:
                ^(YZSegmentItem * _Nonnull item) {
                    ///被点击选中
                    
                }];
             {
                 item.text
                 = obj;
             }
             if (item) {
                 [weakSelf.scrollContentView addSubview:item];
                 [weakSelf.itemsArray addObject:item];
             }
         }];
    }
}

- (void)didLayoutSubviews{
    typeof(self) __weak weakSelf = self;
    
    if (_scrollContentView) {
        _scrollContentView.frame
        = [self didCreatScrollContentViewFrame];
    }
    
    if (_indicator) {
        _indicator.frame
        = [self didCreatIndicatorFrame];
    }
    if (_titles
        &&_titles.count > 0
        &&_itemsArray
        &&_itemsArray.count > 0) {
        [_itemsArray enumerateObjectsUsingBlock:
         ^(YZSegmentItem * _Nonnull obj,
           NSUInteger idx,
           BOOL * _Nonnull stop) {
             obj.frame
             = [weakSelf didCreatItemsFrameInIndex:idx];
             [obj didLayoutSubviews];
         }];
    }
    
    _scrollContentView.contentSize
    = CGSizeMake(CGRectGetMaxX(_itemsArray.lastObject.frame)
                 +(_horizonMargin==0?20:_horizonMargin),
                 CGRectGetHeight(_scrollContentView.frame));
    
}

- (CGRect)didCreatScrollContentViewFrame{
   
    CGRect frame
    = CGRectZero;
    {
        frame.origin
        = CGPointMake(0,
                      0);
        frame.size.width
        = self.bounds.size.width;
        
        frame.size.height
        = self.bounds.size.height
        -10;
    }
    return frame;
    
}

- (CGRect)didCreatItemsFrameInIndex:(NSUInteger)index{
    
    const CGRect scrollFrame
    = [self didCreatScrollContentViewFrame];
    CGRect frame
    = CGRectZero;
    {
        frame.origin.y
        = 0;
        frame.size.height
        = scrollFrame.size.height;
        if (_titles.count
            == _itemsArray.count) {
            YZSegmentItem *item
            = _itemsArray[index];
            if (item.text) {
                [item.titleLabel sizeToFit];
                frame.size.width
                = item.titleLabel.bounds.size.width;
            }
            if (_horizonMargin == 0) {
                _horizonMargin
                = 12;
            }
            if (index == 0) {
                frame.origin.x
                = _horizonMargin ;
            }else{
                frame.origin.x
                = CGRectGetMaxX(_itemsArray[index - 1].frame)
                +_horizonMargin;
            }
        }
        
    }
    return frame;
}

- (CGRect)didCreatIndicatorFrame{
    
    return CGRectZero;
}


- (void)refreshLayout{
    [self didSetProperties];
    [self setupViews];
    [self didLayoutSubviews];
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self refreshLayout];
}

-(void)setTitles:(NSArray<NSString *> *)titles{
    
}

#pragma mark- UIScrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

@end
