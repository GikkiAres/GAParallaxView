//
//  GAPVMainController.m
//  GAParallaxViewDemo
//
//  Created by GikkiAres on 2016/11/22.
//  Copyright © 2016年 Explorer. All rights reserved.
//

#import "GAPVMainController.h"

@interface GAPVMainController ()

@property(nonatomic,strong)GAParallaxView *parallaxView;

@end

@implementation GAPVMainController

//必要参数的提供

//1 用代理请求
//2 初始化函数的必要参数传入.

//不合适
//1 用默认值的方式,对于数值型的必要参数.在init的时候创建一个默认值,不合适.这些值在初始化的时候就要确定啊.系统的init的方式,只是用来创建对象,自己应该提供一个额外的时机来初始化.
/*
 1 init初始化,创建对象.给属性赋值默认值
 2 设置参数,给属性赋指定值.
 3 进一步config.
 
 */


/*
 viewDidLoad中的vc.view的尺寸竟然是xib的尺寸!
 
 
 
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat screenWidth = [[UIScreen mainScreen]bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen]bounds].size.height;

    _parallaxView = [[GAParallaxView alloc]initWithFrame:CGRectMake(0, 0, screenWidth,screenHeight)];
    [self.view addSubview:_parallaxView];
    _parallaxView.initialForegroundY = 450;
    _parallaxView.maxForegroundY = 600;
    _parallaxView.minForegroundY = 200;
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, _parallaxView.maxForegroundY)];
    
    iv.image = [UIImage imageNamed:@"saber.jpg"];
    _parallaxView.backgroundView = iv;
 
    CGRect textRect = CGRectMake(0, 0, screenWidth, 400.0f);
    UITextView *textView = [[UITextView alloc] initWithFrame:textRect];
    textView.text = NSLocalizedString(@"Permission is hereby granted, free of charge, to any person obtaining "
                                      @"a copy of this software and associated documentation files (the "
                                      @"\"Software\"), to deal in the Software without restriction, including "
                                      @"without limitation the rights to use, copy, modify, merge, publish, "
                                      @"distribute, sublicense, and/or sell copies of the Software, and to "
                                      @"permit persons to whom the Software is furnished to do so, subject to "
                                      @"the following conditions...\"", nil);
    textView.textAlignment = NSTextAlignmentCenter;
    textView.font = [UIFont systemFontOfSize:14.0f];
    textView.textColor = [UIColor darkGrayColor];
    textView.editable = NO;
    textView.selectable = NO;

    _parallaxView.foregroundView = textView;
    _parallaxView.speedRatioForeToBack = 3;
    
    [_parallaxView config];
    
 
    
    //没有setAuthor,崩溃.
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
