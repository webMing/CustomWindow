//
//  CustomViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/14.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "UIViewController+SteShowCustomWindow.h"
#import "CustomViewController.h"
#import "SteAWindow.h"
#import <Masonry.h>

@interface CustomViewController ()
/** actionBtn */
@property (strong, nonatomic) UIButton *actionBtn;
@end

@implementation CustomViewController

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    [self.view addSubview:self.actionBtn];
    [self customLayoutSubViews];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"=== Dealloc:%@",NSStringFromClass(self.class));
}

#pragma mark- CreateUI

- (void)configureView {
    self.view.backgroundColor = UIColor.redColor;
}
- (void)customLayoutSubViews {
    [self.actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

#pragma mark- EventRespone
- (void)dimissBtnAction {
    //[SteAWindow dissmissSteWinAnimate:YES];
    [self dissmissFromSteWinAnimate:YES finish:nil];
}
#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

- (UIButton*)actionBtn {
    if (!_actionBtn) {
        _actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_actionBtn setTitle:@"dimiss" forState:UIControlStateNormal];
        [_actionBtn setTitle:@"dimiss" forState:UIControlStateHighlighted];
        [_actionBtn.titleLabel  setFont:[UIFont systemFontOfSize:14.f]];
        [_actionBtn setTintColor:UIColor.lightGrayColor];
        [_actionBtn addTarget:self action:@selector(dimissBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionBtn;
}

#pragma mark- PrivateMethod
- (void)show {
    [SteAWindow showSteWinWithViewController:self animate:YES];
}


@end
