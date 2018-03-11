//
//  TestPthread.m
//  CustomWindow
//
//  Created by Stephanie on 2018/3/3.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "TestPthread.h"

@implementation TestPthread
- (instancetype)init {
    if (self =[super init]) {
        //[[NSRunLoop currentRunLoop]runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        [self setName:@"CustomThread"];
    }
    return self;
}

+ (void)keepLiving {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[NSRunLoop currentRunLoop]addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop]run];
    });
    
}
#pragma mark- Logic Code

@end

