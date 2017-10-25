//
//  SteWindow.h
//  CustomWindow
//
//  Created by Stephanie on 2017/10/13.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SteWindow : UIWindow

+ (void)showSteWinWithViewController:(UIViewController*)vc animate:(BOOL)animate;
+ (void)dissmissSteWinAnimate:(BOOL)animate;

@end

