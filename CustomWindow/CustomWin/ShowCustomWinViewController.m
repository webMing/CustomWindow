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
@property (weak, nonatomic) IBOutlet UIView *layoutTopView;
@property (weak, nonatomic) IBOutlet UIView *layoutBottomView;
@end

@implementation ShowCustomWinViewController

#pragma mark- LifeCicle

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11,*)) {
        UIScrollView* scrollView = nil;
        _layoutTopView.translatesAutoresizingMaskIntoConstraints = NO;
        [_layoutTopView removeConstraints:_layoutTopView.constraints];
        UILayoutGuide* guide = self.view.safeAreaLayoutGuide;
        [_layoutTopView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
        [_layoutTopView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
        [_layoutTopView.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
//        [_layoutTopView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
        [_layoutTopView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor constant:-50].active = YES;
    }
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
