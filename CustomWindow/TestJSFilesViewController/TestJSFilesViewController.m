//
//  TestJSFilesViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2017/11/5.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "TestJSFilesViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface TestJSFilesViewController ()

@end

@implementation TestJSFilesViewController


#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self evaluateScriptFromJSFile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- CreateUI
- (void)evaluateScriptFromJSFile {
    // 执行本地js文件
    NSString * jsPath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"js"];
    NSString * jsString = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:nil];
    JSVirtualMachine* machine =[[JSVirtualMachine alloc]init];
    JSContext* jsContent = [[JSContext alloc]initWithVirtualMachine:machine];
    [jsContent evaluateScript:jsString];
    //JSValue *value = [jsContent evaluateScript:@"city"];
    NSLog(@"%@",[jsContent[@"city"] toArray]);
}
#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod



@end
