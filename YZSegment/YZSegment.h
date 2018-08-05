//
//  YZSegment.h
//  YZSegmentTab
//
//  Created by Lakeside on 2018/6/10.
//  Copyright © 2018 Shin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    kYZSegmentUIStyle_Normal = 1<<0,    //Item text higglighted without zoomed.
    kYZSegmentUIStyle_TitleZoom = 1<<1, //Item text zoomed when selected.
    kYZSegmentUIStyle_TitleHighlighted = 1<<2,  //Item text highlighted when selected.
} kYZSegmentUIStyle;

typedef enum : NSUInteger {
    kYZSegmentIndicatorStyle_Line,  //An indicator line
    kYZSegmentIndicatorStyle_Block, //Tabitem with background color
    kYZSegmentIndicatorStyle_Image, //An image view with custom indicator-image
} kYZSegmentIndicatorStyle; //Indicator's style

typedef enum : NSUInteger {
    kYZSegmentIndicatorAnimationType_FullLengthMoved,   //Indicator length as item's overall length
    kYZSegmentIndicatorAnimationType_ItemsLenthMoved,   //Indicator length as item's area length
    kYZSegmentIndicatorAnimationType_AdsorbMoved,       //Indicator length moved adsorbed.
} kYZSegmentIndicatorAnimationType;     //Indicator (moved) type

@interface YZSegment : UIView

@property (nonatomic, strong) NSArray <NSString *>*titles ;

@property (nonatomic, assign) kYZSegmentUIStyle uiStyle ;

@property (nonatomic, assign) kYZSegmentIndicatorStyle indicatorStyle ;

@property (nonatomic, assign) kYZSegmentIndicatorAnimationType indicatorAnimationType ;

@property (nonatomic, assign) CGFloat horizonMargin ;

@property (nonatomic, strong) UIScrollView *contentScrollView ;

/** Init */
-(instancetype)initWithTitles:(NSArray <NSString *>*)titles;


-(instancetype)initWithFrame:(CGRect)frame
                      titles:(NSArray <NSString *>*)titles;



/** Change title's data source dynamically */
//-(void)setTitles:(NSArray * _Nonnull)titles;

-(void)setIndicatorStyle:(kYZSegmentIndicatorStyle)indicatorStyle;

-(void)setIndicatorAnimationType:(kYZSegmentIndicatorAnimationType)indicatorAnimationType;

@end

NS_ASSUME_NONNULL_END
