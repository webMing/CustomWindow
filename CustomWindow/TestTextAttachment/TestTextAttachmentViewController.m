//
//  TestTextAttachmentViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/30.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "TestTextAttachmentViewController.h"
#import "NSTextAttachment_Custom.h"

@interface TestTextAttachmentViewController ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@end

@implementation TestTextAttachmentViewController


#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- CreateUI

#pragma mark- ConfigureUI

- (void)configureUI {
    NSMutableAttributedString* mutAttrStr = [[NSMutableAttributedString alloc]initWithString:@"Tomorow is better " attributes:@{NSForegroundColorAttributeName:UIColor.lightGrayColor}];
    NSTextAttachment* attm = [[NSTextAttachment alloc]init];
    attm.image = [UIImage imageNamed:@"green-positioning"];
    attm.bounds = [attm configureAttmentRectWithX:0 Y:-3 Height:15];
    NSAttributedString* attmStr = [NSAttributedString attributedStringWithAttachment:attm];
    [mutAttrStr appendAttributedString:attmStr];
    self.contentLabel.attributedText = mutAttrStr;
}

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

@end
