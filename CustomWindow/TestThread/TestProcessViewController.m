//
//  TestProcessViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2018/3/3.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "TestProcessViewController.h"
#import "TestPthread.h"

@interface TestProcessViewController ()
@property (nonatomic, strong) TestPthread* th;
@end

@implementation TestProcessViewController

#pragma mark- LifeCicle

- (void)viewDidLoad {
    [super viewDidLoad];
    _th = [[TestPthread alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
   
}

#pragma mark- CreateUI

#pragma mark- EventRespone
/// 触发线程事件
- (IBAction)fireThread:(UIButton *)sender {
    
    [self performSelector:@selector(excuteCustomCode:) onThread:_th withObject:@3 waitUntilDone:NO];
    /*
    BOOL shouldKeepRunning = YES;// global
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode]; // adding some input source, that is required for runLoop to runing
//    while (shouldKeepRunning && [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]); // s
    NSThread* thread =  [[NSThread alloc]init];
    [self performSelector:@selector(excuteCustomCode:) onThread:thread withObject:@4 waitUntilDone:NO];
    [thread start];
    
    NSThread* thread =  [[NSThread alloc]init];
    [self performSelector:@selector(excuteCustomCode:) onThread:thread withObject:@4 waitUntilDone:NO];
     [thread start];
    NSRunLoop* lp = [NSRunLoop currentRunLoop];
     */

}

- (void)excuteCustomCode:(id)obj {
    NSLog(@"excode:%@",obj);
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod




@end
