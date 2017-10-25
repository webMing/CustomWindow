//
//  SteAWindow.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/15.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "SteAWindow.h"

@implementation SteAWindow

#pragma mark- LifeCicle

+ (instancetype)shareWindow {
    static SteAWindow* win = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        win = [[SteAWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    return win;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [UIViewController new];
        self.rootViewController.view.backgroundColor = UIColor.clearColor;
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
}

- (void)dismiss {
    self.hidden = YES;
}

+ (void)showSteWinWithViewController:(UIViewController*)vc animate:(BOOL)animate {
    
    SteAWindow* win = [SteAWindow shareWindow];
    [win show];
    // 之前创建了一个自定义ViewController 在ViewDidAppear中添加代码回调代码来解决在 root view controller 过早推出 vc 造成的问题；但是遇到在vc dimiss时候还会出现再回调一次情况.
    // 这里使用一个延时来解决过早退出vc的问题
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (vc) {
            [win.rootViewController presentViewController:vc animated:animate completion:nil];
        }
    });
    
}

+ (void)showSteWinWithViewController:(UIViewController*)vc animate:(BOOL)animate finish:(void(^)(void))block {
    SteAWindow* win = [SteAWindow shareWindow];
    [win show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (vc) {
            [win.rootViewController presentViewController:vc animated:animate completion:^{
                if (block) {
                    block();
                }
            }];
        }
    });
}

+ (void)dissmissSteWinAnimate:(BOOL)animate {
    SteAWindow* win = [SteAWindow shareWindow];
    [win.rootViewController dismissViewControllerAnimated:animate completion:^{
        [win dismiss];
    }];
}

+ (void)dissmissSteWinAnimate:(BOOL)animate finish:(void(^)(void))block{
    SteAWindow* win = [SteAWindow shareWindow];
    [win.rootViewController dismissViewControllerAnimated:animate completion:^{
        if (block) {
            block();
        }
        [win dismiss];
    }];
}
@end
