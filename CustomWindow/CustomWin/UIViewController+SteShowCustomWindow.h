//
//  UIViewController+SteShowCustomWindow.h
//  CustomWindow
//
//  Created by Stephanie on 2017/10/25.
//Copyright © 2017年 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 *添加ViewController分类;方便ViewController直接调用;不用引入SteWin头文件;
 */
@interface UIViewController (SteShowCustomWindow)
- (void)showSteWinWithViewController:(UIViewController*)vc animate:(BOOL)animate;
- (void)dissmissFromSteWinAnimate:(BOOL)animate finish:(void(^)(void))block;
- (void)dissmissFromSteWinAnimate:(BOOL)animate;
- (void)showInSteWinAnimate:(BOOL)animate finish:(void(^)(void))block;
- (void)showInSteWinAnimate:(BOOL)animate;
@end
