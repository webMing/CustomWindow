//
//  AbountKvcAndKvoViewController.m
//  CustomWindow
//  Created by Stephanie on 2018/3/1.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "AbountKvcAndKvoViewController.h"
#import "SteKeyValueObserver.h"
#import "SteKeyValueColor.h"

@interface AbountKvcAndKvoViewController ()
/** r slide */
@property (weak, nonatomic) IBOutlet UISlider *rSlider;
@property (weak, nonatomic) IBOutlet UISlider *gSlider;
@property (weak, nonatomic) IBOutlet UISlider *bSlider;
@property (weak, nonatomic) IBOutlet UIView *displayView;
@property (strong, nonatomic) SteKeyValueColor* colorObj;
@end

@implementation AbountKvcAndKvoViewController
// 阅读的时候可以参考的内容
// 参考文章的内容:http://yulingtianxia.com/blog/2014/05/12/objective-czhong-de-kvche-kvo/
#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureVC];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)configureVC {
    _colorObj = [[SteKeyValueColor alloc]init];
    [SteKeyValueObserver observeObject:_colorObj keyPath:@"color" target:self option:NSKeyValueObservingOptionInitial selector:@selector(colorDidChange:)];
}

#pragma mark- CreateUI

#pragma mark- EventRespone

- (IBAction)changeValue:(UIButton *)sender {
    //这里也是可以手动控制出发时机
    //[self willChangeValueForKey:@"testVar"];
    //[self didChangeValueForKey:@"testVar"];
}
- (IBAction)rValueChange:(UISlider *)sender {
    _colorObj.rValue = sender.value;
}
- (IBAction)gValueChange:(UISlider *)sender {
    _colorObj.gValue = sender.value;
}
- (IBAction)bValueChange:(UISlider *)sender {
    _colorObj.bValue = sender.value;
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod
// 注意控制的顺序
//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
//    return YES;
//}
// 控制是否自动发送通知消息;这个方法由系统提示提供;
//+ (BOOL)automaticallyNotifiesObserversOfTestVar{
//    return NO;
//}

/*
 // 手动控制出发时机;
- (void)setTestVar:(NSInteger)testVar {
    [self willChangeValueForKey:@"testVar"];
    _testVar = testVar;
    [self didChangeValueForKey:@"testVar"];
}
*/
/*
- (void)logicCode {
    [self addObserver:self forKeyPath:@"testVar" options:NSKeyValueObservingOptionNew  context:(__bridge void *)self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == (__bridge void*)self) {
        NSString* displayStr;
        if (self.testVar == 0) {
            displayStr = @"刚刚初始化";
        }else{
            displayStr = [NSString stringWithFormat:@"已经初始化的值:%ld",self.testVar];
        }
        self.displayLB.text = displayStr;
    }
}
*/

- (void)colorDidChange:(NSDictionary*)dict {
    _displayView.backgroundColor = _colorObj.color;
}
@end
