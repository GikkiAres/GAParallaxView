//
//  GAParallaxView.m
//  GAParallaxViewDemo
//
//  Created by GikkiAres on 2016/11/22.
//  Copyright © 2016年 Explorer. All rights reserved.
//

#import "GAParallaxView.h"

@interface GAParallaxView ()<
    UIScrollViewDelegate
>

@property(nonatomic,strong)UIScrollView *backgroundScrollView;
@property(nonatomic,strong)UIScrollView *foregroundScrollView;


@end


@implementation GAParallaxView
//@dynamic  author;
static NSString * _author = @"None";
+ (void)setAuthor:(NSString *)author {
    _author = author;
}

+(NSString *)author {
    return _author;
}

+ (void)load {
    GAParallaxView.author = @"GikkiAres";
    NSLog(@"%@",GAParallaxView.author);
}

- (void)config {
    [NSBundle mainBundle];
    
    _backgroundScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    _foregroundScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    [self addSubview:_backgroundScrollView];
    [self addSubview:_foregroundScrollView];

    
    
    _backgroundScrollView.contentSize = self.bounds.size;
    //滑动的距离应该是 本身高度+能够上滑的距离
    CGFloat upScrollDistance = _initialForegroundY-_minForegroundY;
    _foregroundScrollView.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height+upScrollDistance);
    _foregroundScrollView.showsVerticalScrollIndicator = NO;
    
    
    _backgroundView.frame = CGRectMake(0, 0, _backgroundView.frame.size.width, _backgroundView.frame.size.height);
    _foregroundView.frame = CGRectMake(0, _initialForegroundY, _foregroundView.frame.size.width, _foregroundView.frame.size.height);
    
    [_backgroundScrollView addSubview:_backgroundView];
    [_foregroundScrollView addSubview:_foregroundView];
    
    _foregroundScrollView.delegate = self;
    
}


#pragma UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //根据foregroundScrollView的contentOffset得出backgroundScrollView的contentOffset
    CGPoint foregroundOffset = scrollView.contentOffset;
    CGPoint backgroundOffset = CGPointMake(foregroundOffset.x/_speedRatioForeToBack, foregroundOffset.y/_speedRatioForeToBack);
    _backgroundScrollView.contentOffset = backgroundOffset;
}



@end
