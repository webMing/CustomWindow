//
//  ViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/13.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "MainViewController.h"
#import "CustomViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark- LifeCicle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- CreateUI

#pragma mark- EventRespone
- (IBAction)showViewControllerAction:(id)sender {
    CustomViewController* vc = [CustomViewController new];
    [vc show];
}
#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod




@end
