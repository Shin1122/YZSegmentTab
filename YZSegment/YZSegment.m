//
//  YZSegment.m
//  YZSegmentTab
//
//  Created by Lakeside on 2018/6/10.
//  Copyright © 2018 Shin. All rights reserved.
//

#import "YZSegment.h"
#import "YZSegmentItem.h"

@interface YZSegment (){
    
}

@property (nonatomic, strong) UIScrollView *scrollContentView ;
@property (nonatomic, strong) NSMutableArray <YZSegmentItem *>*itemsArray ;

@end

@implementation YZSegment

-(instancetype)initWithTitles:(NSArray<NSString *> *)titles{
    self
    = [super init];
    if (self) {
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

- (CGRect)didCreatItemsFrameInIndex:(NSUInteger)index{
    
    return CGRectZero;
}


@end
