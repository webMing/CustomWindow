//
//  ShowCustomWinViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2017/11/5.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "ShowCustomWinViewController.h"
#import "UIViewController+SteShowCustomWindow.h"
#import "CustomViewController.h"

@interface ShowCustomWinViewController ()

@end

@implementation ShowCustomWinViewController


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

- (IBAction)showViewControllerAction:(id)sender {
    CustomViewController* vc = [CustomViewController new];
    [self showSteWinWithViewController:vc animate:YES];
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod



@end
