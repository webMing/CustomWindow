//
//  ApplayForQuestionViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2018/3/22.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "ApplayForQuestionViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <CoreFoundation/CoreFoundation.h>
@interface ApplayForQuestionViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@end

int a = 10;

void(^myblock)(void) = ^{
    a = 30;
    NSLog(@"%d",a);
};

@implementation ApplayForQuestionViewController

#pragma mark- LifeCicle

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    _objc_msgForward();
//    instrumentObjcMessageSends(YES);
    //[self performSelector:@selector(doTestTask)];
//    instrumentObjcMessageSends(NO);
    
}

#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod
//tracing msg send

//利用imageNamed创建的图片什么时候释放



@end
