//
//  LearnViewAnimationViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2018/3/12.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "LearnViewAnimationViewController.h"

@interface LearnViewAnimationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (assign, nonatomic) BOOL isUnderAnimation;
@property (assign, nonatomic) NSUInteger numberCounter;
@property (strong, nonatomic) dispatch_source_t source_t;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelWithContraint;
@end

@implementation LearnViewAnimationViewController


#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    _isUnderAnimation = NO;
    _numberCounter = 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- CreateUI
- (void)baseAnimation {
    
}

#pragma mark- EventRespone

- (IBAction)beginAnimation:(UIButton *)sender {
    //[self baseAnimation];
    [self blockAnimation];
}

- (void)animationWillBegin:(id)ctn {
    NSLog(@"animation will begin");
    _isUnderAnimation = YES;
    _testLabel.text = [NSString stringWithFormat:@"%d",_numberCounter++];
}

- (void)animationDidStop:(id)ctn {
    NSLog(@"animation did stop");
    _testLabel.alpha = 1;
    _testLabel.transform = CGAffineTransformIdentity;
    _isUnderAnimation = NO;
    if (_numberCounter < 12) {
       [self changeWidthWithAnimation];
    }
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

- (void)changeWidthWithAnimation {
    
    /**
     使用这种方式是可以实现对Contraint的动画
    _labelWithContraint.constant = 50.f;
    [UIView animateWithDuration:2.0 animations:^{
         [self.view layoutIfNeeded];
    }];
    return;
     */
    if (_isUnderAnimation) {
        return;
    }
    [UIView beginAnimations:@"AnimationId" context:nil];
    [UIView setAnimationWillStartSelector:@selector(animationWillBegin:)];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:)];
    [UIView setAnimationRepeatAutoreverses:NO]; //是否执行相反动画
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];//动画效果
    [UIView setAnimationDelay:0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:2];
    [UIView setAnimationRepeatCount:1];
    //对多个可动画的属性进行一起提交动画
//    _testLabel.alpha = 0.0f;
//    CGAffineTransform transform = _testLabel.transform;
//    _testLabel.transform = CGAffineTransformScale(transform, 0.1, 0.1);
    [UIView setAnimationTransition:UIViewAnimationOptionTransitionCurlDown forView:_testLabel cache:NO];
    [UIView commitAnimations];
    /*layout不能使用 [UIView commitAnimations] 这种形式来进行动画,因为可进行动画是UIView的 animatable properties ofview */
    
}

- (void)blockAnimation {
    
    /*
    [UIView animateWithDuration:2 delay:0 options: UIViewAnimationOptionCurveEaseIn
 animations:^{
        _testLabel.alpha = 0.0f;
    } completion:^(BOOL finished) {
        NSLog(@"animation finished!");
    }];
     */
    
    /*
     UIViewAnimationOptionTransitionNone            = 0 << 20, // default
     UIViewAnimationOptionTransitionFlipFromLeft    = 1 << 20,
     UIViewAnimationOptionTransitionFlipFromRight   = 2 << 20,
     UIViewAnimationOptionTransitionCurlUp          = 3 << 20,
     UIViewAnimationOptionTransitionCurlDown        = 4 << 20,
     UIViewAnimationOptionTransitionCrossDissolve   = 5 << 20,
     UIViewAnimationOptionTransitionFlipFromTop     = 6 << 20,
     UIViewAnimationOptionTransitionFlipFromBottom  = 7 << 20,
     
     + (void)transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^ __nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(4_0);
     
     + (void)transitionFromView:(UIView *)fromView toView:(UIView *)toView duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(4_0); // toView added to fromView.superview, fromView removed from its superview
     */
    
    [UIView transitionWithView:_testLabel duration:1 options:UIViewAnimationOptionTransitionCurlUp  animations:^{
        _testLabel.text = [NSString stringWithFormat:@"%ld",_numberCounter++];
    } completion:^(BOOL finished) {
        if(finished) {
            [self blockAnimation];
        }
    }];
    
}

@end
