//
//  GAParallaxView.h
//  GAParallaxViewDemo
//
//  Created by GikkiAres on 2016/11/22.
//  Copyright © 2016年 Explorer. All rights reserved.
//




#import <UIKit/UIKit.h>

@interface GAParallaxView : UIView

@property(class,strong) NSString *author;

//背景起始在0,前景内容的起始位置.
@property(nonatomic,assign)CGFloat initialForegroundY;
//最大视差,应该设置为backgroundView的展示内容高度
@property(nonatomic,assign)CGFloat maxForegroundY;
//最小视差,应该设置为backgroundView的最小展示的内容高度.
@property(nonatomic,assign)CGFloat minForegroundY;

@property(nonatomic,strong)UIView *backgroundView;
@property(nonatomic,strong)UIView *foregroundView;
//前景:背景的滑动比率
@property(nonatomic,assign)CGFloat speedRatioForeToBack;

- (void)config;

@end
