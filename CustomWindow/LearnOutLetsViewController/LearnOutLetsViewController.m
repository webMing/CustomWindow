//
//  LearnOutLetsViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2017/11/11.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "LearnOutLetsViewController.h"

@interface LearnOutLetsViewController ()
@property (weak, nonatomic) IBOutlet UILabel* festLb;
@property (weak, nonatomic) IBOutlet UILabel* sestLb;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer* fTapGesture;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer* sTapGesture;
@property (weak, nonatomic) IBOutlet UITextField *textFiled;
@property (weak, nonatomic) IBOutletCollection(UIButton) NSArray* btns;
@end

@implementation LearnOutLetsViewController

#pragma mark- LifeCicle

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- CreateUI

#pragma mark- EventRespone

- (IBAction)submitAction:(UIButton *)sender {
    if (@available(iOS 11.0, *)) {
        
    } else {
        
    }
    //提交表单不能为空/
    //NSAssert(self.textFiled.text.length != 0, @"提交表单内容不能为空");
    //NSCAssert([self.textFiled.text integerValue] == 0, @"提交的内容必须为整数0");
    NSParameterAssert(self.textFiled.text.length > 1);
}
#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

@end
