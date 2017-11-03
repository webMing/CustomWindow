//
//  Custom.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/31.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "NSString+Custom.h"

@implementation NSString (Custom)
- (BOOL)isNoBlack {
    NSCharacterSet* charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (int i = 0; i < self.length ; i++) {
        unichar ch = [self characterAtIndex:i];
        if ([charSet characterIsMember:ch]) {
            return NO;
        }
    }
    return YES;
}
@end
