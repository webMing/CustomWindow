//
//  GCDTimerVSNSTimerViewController.m
//  CustomWindow
//  Created by Stephanie on 2018/3/9.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "GCDTimerVSNSTimerViewController.h"
#import <objc/runtime.h>

typedef NS_ENUM(NSUInteger, GCDTimerStatus) {
    GCDTimerStatusRuning = 1,
    GCDTimerStatusSubpenging = 2,
    GCDTimerStatusOther = 3,
};

@interface GCDTimerVSNSTimerViewController ()
@property (nonatomic, strong) dispatch_source_t gcdTimer;
@property (nonatomic, strong) NSTimer* nsTimer;
@property (nonatomic, assign) GCDTimerStatus gcdTimerStatus;
@end

@implementation GCDTimerVSNSTimerViewController {
    __block int _fireTimes;
}

#pragma mark- LifeCicle

- (void)viewDidLoad {
    [super viewDidLoad];
    _fireTimes = 10;
    dispatch_queue_t queue = dispatch_queue_create("com.bestswifter.queue", nil);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark- CreateUI

#pragma mark- EventRespone

- (IBAction)triggerGCDTimerAction:(UIButton *)sender {
    
    /* Other people`s codes
     dispatch_queue_t queue = dispatch_get_main_queue();
     _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
     dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW,
     2.0 * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
     dispatch_source_set_event_handler(_timer, ^() {
     NSLog(@"doing something!");
     });
     dispatch_resume(_timer);
     */
    
    if (_gcdTimer) return;
    __weak typeof(self) weakSelf = self;
    _gcdTimerStatus = GCDTimerStatusRuning;
    
    //创建的时候可以使用dispath_source 快捷方式; 也可以选择全部手写，这样对参数有更过了解与控制
    dispatch_queue_t queue = dispatch_queue_create("com.taobus.www", DISPATCH_QUEUE_SERIAL);
    //如果timer不设置为属性或者没有一个强引用;出了作用域范围外就会被释放；
    _gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //自定义时间
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 0);
    //struct timespec wallTimespec = {NSNUll, NSEC_PER_SEC};
    dispatch_time_t wallTime = dispatch_walltime(NULL, 0);
     //设置事件处理逻辑
    dispatch_source_set_timer(_gcdTimer,wallTime, 1 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_gcdTimer, ^{
        NSLog(@"GCD Timer Fire");
        /*如果这里写subpend判断逻辑要注意 若引用 与 强引用
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf->_fireTimes--;
        if (strongSelf->_fireTimes < 0) {
            strongSelf->_gcdTimerStatus = GCDTimerStatusSubpenging;
            dispatch_suspend(strongSelf->_timer);
        }
         */
    });
    //设置_timer取消之后的处理
    dispatch_source_set_cancel_handler(_gcdTimer, ^{
        NSLog(@"cancel _timer!");
    });
    //刚刚创建timer时的状态为 suspend, suspend count 为1 ，所以要调用resume来平衡，启动timer
    dispatch_resume(_gcdTimer);
    
}

- (IBAction)subpendGCDTimerAction:(UIButton *)sender {
    if (_gcdTimerStatus == GCDTimerStatusRuning) {
        _gcdTimerStatus = GCDTimerStatusSubpenging;
        dispatch_suspend(_gcdTimer);
    }
}

- (IBAction)resumeGCDTimerAction:(UIButton *)sender {
    if (_gcdTimerStatus == GCDTimerStatusSubpenging) {
        _gcdTimerStatus = GCDTimerStatusRuning;
        dispatch_resume(_gcdTimer);
    }
}

- (void)invalidateMyGCDTimer {
    /*当被释放的时候需要判断dispath_suspend与dispath_dispath_resume是否平衡,不然会造成crash*/
    if (_gcdTimer)
    {
        if (_gcdTimerStatus == GCDTimerStatusSubpenging)
        {
            dispatch_resume(_gcdTimer);
        }
        dispatch_source_cancel(_gcdTimer);
        _gcdTimer = nil;
    }
}

- (IBAction)triggerNSTimerAction:(UIButton *)sender {
    
    
    
    /*在主线程中创建NSTimer
    if (!_nsTimer) {
        __weak typeof(self) weakSelf = self;
        _nsTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakSelf selector:@selector(nstimerFired:) userInfo:@3 repeats:YES];
    } */
     
    dispatch_queue_t queue = dispatch_queue_create("com.taobus.www", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        // 在子线程中创建NSTimer
        //特别要注意NSTimer 对Target的强引用; 当 repeats参数为YES，很容易造成循环引用
        if (!_nsTimer) {
            __weak typeof(self) weakSelf = self;
            _nsTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakSelf selector:@selector(nstimerFired:) userInfo:@3 repeats:YES];
            [[NSRunLoop currentRunLoop]addTimer:_nsTimer forMode:NSDefaultRunLoopMode];
            [[NSRunLoop currentRunLoop]run];
            //log信息在Timer失效后执行;
            NSLog(@"NSTimer Has Set UP");
        }
    });
    
}

- (IBAction)stopNSTimerAction:(UIButton *)sender {
    [self invalidateMyNSTimer];
}

- (void)nstimerFired:(id)obj {
    _fireTimes--;
    if (_fireTimes < 0) {
        [self invalidateMyNSTimer];
    }
    NSLog(@"NSTimer fired!");
}

- (void)invalidateMyNSTimer {
    /*注意在view controller dealloc 调用此方法以此销毁NStimer*/
    if (_nsTimer) {
        [_nsTimer invalidate];
        _nsTimer = nil;
    }
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

- (void)dealloc {
    //销毁GCDTimer
    [self invalidateMyGCDTimer];
    //销毁NSTimer
    [self invalidateMyNSTimer];
    NSLog(@"Dealloc Obj:%@",NSStringFromClass(self.class));
}

@end


