//
//  YZSegmentItem.h
//  YZSegmentTab
//
//  Created by Lakeside on 2018/6/10.
//  Copyright © 2018 Shin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class YZSegmentItem;

typedef enum : NSUInteger {
    kYZSegmentItemTypeText,
} kYZSegmentItemType;

typedef void(^Selected)(YZSegmentItem *item);

@interface YZSegmentItem : UIView

@property (nonatomic, assign) kYZSegmentItemType type ;
@property (nonatomic, strong) UILabel *titleLabel ;

///properties for titleLabel
@property (nonatomic, strong) UIFont *font ;
@property (nonatomic, strong) UIFont *selectedFont ;
@property (nonatomic, strong) UIColor *backgroundColor ;
@property (nonatomic, strong) UIColor *selectedBackgroundColor ;
@property (nonatomic, strong) UIColor *textColor ;
@property (nonatomic, strong) UIColor *selectedTextColor ;

@property (nonatomic, strong) NSString *text ;
@property (nonatomic, assign) BOOL selected;


@property (nonatomic, copy) Selected didSelected ;




@property (nonatomic, strong) UITapGestureRecognizer *tap ;

-(instancetype)initWithFrame:(CGRect)frame
                 didSelected:(Selected)selected;

- (void)didLayoutSubviews;


@end

NS_ASSUME_NONNULL_END
