//
//  SteWindow.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/13.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "SteWindow.h"
#import "UIApplication+SteWindow.h"
#import "AppDelegate.h"

/*
   可以把Window做成一个单例来避免[win makeKeyAndVisible]时候win释放；
   之前也想到添加一个Static关键字来做;但是感觉没有单例实现好；
   例子中给[UIApplication sharedApplication] 分类添加属性来做；
   此外[UIApplication sharedApplication].windows 也会保存Window一个实例
   (如果修改windowLevelStatusBar 或者是windowLevelStatusAlter 不用添加强引用)
 * 在实际项目不建议使用window.rootViewController来推其他视图;
   可以直接在keyWindow上面添加子视图来实现，动画需要自己实现;
 * 在实现win的时候要注意 windowLevel、hidden属性;[UIApplication sharedApplication].windows中wins的个数.
 */

@implementation SteWindow

#pragma mark- LifeCicle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}

#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

- (void)show {
    [self makeKeyAndVisible];
    self.hidden = NO;
    //测试[UIApplication sharedApplication].windows 是否对SteWindow实例强引用
    //[SteWindow displayAllWins];
}

- (void)dismiss {
    self.hidden = YES;
}

+ (void)showSteWinWithViewController:(UIViewController*)vc animate:(BOOL)animate {
   
    SteWindow* win = (SteWindow*)[UIApplication sharedApplication].otherWin;
    if (!win) {
        win = [[SteWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        win.rootViewController = [UIViewController new];
        [UIApplication sharedApplication].otherWin = win;
    }
    [win show];
    // 之前创建了一个自定义ViewController 在ViewDidAppear中添加代码回调代码来解决在 root view controller 过早推出 vc 造成的问题；但是遇到在vc dimiss时候还会出现再回调一次情况.
    // 这里使用一个延时来 解决过早退出vc的问题
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (vc) {
            [win.rootViewController presentViewController:vc animated:animate completion:nil];
        }
    });
    
}

+ (void)dissmissSteWinAnimate:(BOOL)animate {
    SteWindow* win = (SteWindow*)[UIApplication sharedApplication].otherWin;
    if (win) {
        [win.rootViewController dismissViewControllerAnimated:animate completion:^{
            [win dismiss];
        }];
    }
}

+ (void)displayAllWins {
    // 相同WinLevel在windows中的顺序是以makeKeyAndVisible,winlevel 在windows数组索引越越大
    NSArray<UIWindow*>* winArray = [UIApplication sharedApplication].windows;
    [winArray enumerateObjectsUsingBlock:^(UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"index:%ld class:%@  winLevel:%f",idx,NSStringFromClass(obj.class),obj.windowLevel);
    }];
    
}

@end



