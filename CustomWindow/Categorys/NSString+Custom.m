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
//        NSLog(@"%ld",ch);
        if ([charSet characterIsMember:ch]) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)isContainBlack {
   NSRange blackRange = [self rangeOfCharacterFromSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  if(blackRange.location == NSNotFound) {
       return NO;
  }else{
       return YES;
  }
   
}

/* To avoid breaking up character sequences such as Emoji, you can do:
 [str substringFromIndex:[str rangeOfComposedCharacterSequenceAtIndex:index].location]
 [str substringToIndex:NSMaxRange([str rangeOfComposedCharacterSequenceAtIndex:index])]
 [str substringWithRange:[str rangeOfComposedCharacterSequencesForRange:range]
 
 
 [string enumerateSubstringsInRange:NSMakeRange(0, string.length)                      // enumerate the whole range of the string
 options:NSStringEnumerationByComposedCharacterSequences    // by composed character sequences
 usingBlock:^(NSString * substr, NSRange substrRange, NSRange enclosingRange, BOOL *stop) {
 ... use substr, whose range in string is substrRange ...
 }];
 */
@end
