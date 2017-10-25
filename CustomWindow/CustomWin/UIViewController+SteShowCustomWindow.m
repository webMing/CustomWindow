//
//  UIViewController+SteShowCustomWindow.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/25.
//Copyright © 2017年 Stephanie. All rights reserved.
//

#import "UIViewController+SteShowCustomWindow.h"
#import "SteAWindow.h"
@implementation UIViewController (SteShowCustomWindow)

- (void)showSteWinWithViewController:(UIViewController*)vc animate:(BOOL)animate{
    [SteAWindow showSteWinWithViewController:vc animate:animate];
}

- (void)dissmissFromSteWinAnimate:(BOOL)animate {
    [SteAWindow dissmissSteWinAnimate:animate];
}

- (void)dissmissFromSteWinAnimate:(BOOL)animate finish:(void(^)(void))block {
    [SteAWindow dissmissSteWinAnimate:animate finish:^{
        if (block) {
            block();
        }
    }];
}

- (void)showInSteWinAnimate:(BOOL)animate {
   [SteAWindow showSteWinWithViewController:self animate:animate];
}

- (void)showInSteWinAnimate:(BOOL)animate finish:(void(^)(void))block {
    [SteAWindow showSteWinWithViewController:self animate:animate finish:^{
        if (block) {
            block();
        }
    }];
}
@end
