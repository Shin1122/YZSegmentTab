//
//  ViewController.m
//  YZSegmentTab
//
//  Created by Lakeside on 2018/6/10.
//  Copyright © 2018 Shin. All rights reserved.
//

#import "ViewController.h"
#import "YZSegment.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YZSegment *segment1
    = [[YZSegment alloc]initWithFrame:CGRectMake(0,
                                                 69,
                                                 SCREENWIDTH,
                                                 60)
                               titles:@[
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
                                            ]];
    {
       
    }
    [self.view addSubview:segment1];
    

}


@end
