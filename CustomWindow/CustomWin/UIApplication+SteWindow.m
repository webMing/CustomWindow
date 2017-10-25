//
//  UIApplication+SteWindow.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/15.
//Copyright © 2017年 Stephanie. All rights reserved.
//

#import "UIApplication+SteWindow.h"
#import <objc/runtime.h>
/*
 *
 */
static void* kSteUIApplicationWindowKey = &kSteUIApplicationWindowKey;

@implementation UIApplication (SteWindow)

- (void)setOtherWin:(UIWindow *)otherWin {
    objc_setAssociatedObject(self, kSteUIApplicationWindowKey, otherWin, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIWindow*)otherWin {
    return objc_getAssociatedObject(self, kSteUIApplicationWindowKey);
}
@end
