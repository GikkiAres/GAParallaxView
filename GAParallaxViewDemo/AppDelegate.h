//
//  AppDelegate.h
//  GAParallaxViewDemo
//
//  Created by GikkiAres on 2016/11/22.
//  Copyright © 2016年 Explorer. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 内容说明:
 1 两个scrollView是同大小的,只是内容的起始位置有差值.
 2 滑动时,通过前景的位置,调整背景的位置,造成两个内容滑动速度不一致的效果.
 
 
 
 */




@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

