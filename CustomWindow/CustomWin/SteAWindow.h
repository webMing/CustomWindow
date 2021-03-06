//
//  SteAWindow.h
//  CustomWindow
//
//  Created by Stephanie on 2017/10/15.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SteAWindow : UIWindow

+ (void)showSteWinWithViewController:(UIViewController*)vc animate:(BOOL)animate;
+ (void)showSteWinWithViewController:(UIViewController*)vc animate:(BOOL)animate finish:(void(^)(void))block;
+ (void)dissmissSteWinAnimate:(BOOL)animate;
+ (void)dissmissSteWinAnimate:(BOOL)animate finish:(void(^)(void))block;

@end
