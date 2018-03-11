//
//  NSStringEncodingViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2018/3/8.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "NSStringEncodingViewController.h"
#import "NSString+Custom.h"

@interface NSStringEncodingViewController ()

@end

@implementation NSStringEncodingViewController

#pragma mark- LifeCicle

- (void)viewDidLoad {
 
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

- (void)testStr {
    NSString* defaultEncodeStr = @"𝌆";
    NSLog(@"This Default Encode Str:%@",defaultEncodeStr);
    NSLog(@"String Lenth:%lu",(unsigned long)defaultEncodeStr.length);
    for (int i = 0; i < defaultEncodeStr.length ; i++) {
        unichar ch = [defaultEncodeStr characterAtIndex:i];
        NSLog(@"%hu\n",ch);
    }
    //    NSString *s = @"\u0084"; 不允许使用c字符集
    
    NSString *s = @"\U0001F30D"; // earth globe emoji 🌍
    NSLog(@"The length of %@ is %lu", s, [s length]);
    
    NSUInteger realLength =
    [s lengthOfBytesUsingEncoding:NSUTF32StringEncoding] / 4;
    NSLog(@"The real length of %@ is %lu", s, realLength);
    // => The real length of 🌍 is 1
    
    NSString *h = @"e\u0301"; // e + ´
    NSLog(@"The length of %@ is %lu", h, [h length]);
    
    NSString *m = @"The weather on \U0001F30D is \U0001F31E today.";
    // The weather on 🌍 is 🌞 today.
    NSRange fullRange = NSMakeRange(0, [m length]);
    [m enumerateSubstringsInRange:fullRange
                          options:NSStringEnumerationByComposedCharacterSequences
                       usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
     {
         NSLog(@"%@ %@", substring, NSStringFromRange(substringRange));
     }];
    
    NSString* customStr = [NSString stringWithUTF8String:"🌍"];
    NSString* tt = [[NSString alloc]initWithData:[@"🌍" dataUsingEncoding:NSUTF8StringEncoding] encoding:NSUTF8StringEncoding];
    for (int i = 0; i < tt.length ; i++) {
        unichar ch = [tt characterAtIndex:i];
        NSLog(@"%hu\n",ch);
    }
}

@end
