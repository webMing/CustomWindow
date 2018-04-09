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
#import <dlfcn.h>


//#define libObj dlopen("/usr/lib/libobjc.dylib",RTLD_LAZY)
//linstrumentObjcMessageSends(BOOL);

typedef void(*func)(BOOL);
static inline void ste_tracing_msg(BOOL yesOrNo) {
   void* libObj = dlopen("/usr/lib/libobjc.dylib",RTLD_LAZY);
   func instrumentObjcMessageSends = dlsym(libObj, "instrumentObjcMessageSends");
   instrumentObjcMessageSends(yesOrNo);
}

@interface ApplayForQuestionViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@end

//extern instrumentObjcMessageSends();


@implementation ApplayForQuestionViewController
//+(void)load;
#pragma mark- LifeCicle

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* str = @"";
    [str UTF8String];
    [self tracingMsgSend];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod
//tracing msg send
- (void)tracingMsgSend {
    /*
     使用的时候需要先声明该函数，不然会报错的哦
     extern instrumentObjcMessageSends();
     log 文件保存在/tem/mgs-xxx 其中xxx是PID
    
    instrumentObjcMessageSends(YES);
    [self performSelector:@selector(testMethod)];
    instrumentObjcMessageSends(NO);
     */
    /*
     同上面相同使用的时候需要添加头文件#import<dlopen>
    ste_tracing_msg(YES);
    [self performSelector:@selector(testMethod)];
    ste_tracing_msg(NO);
     */
    

}

- (void)testBlock {
    
    __block NSMutableString *a = [NSMutableString stringWithString:@"Tom"];
    //    NSMutableString *a = [NSMutableString stringWithString:@"Tom"];
    NSLog(@"\n 定以前：------------------------------------\n\
          a指向的堆中地址：%p；a在栈中的指针地址：%p", a, &a);               //a在栈区
    void (^foo)(void) = ^{
        a.string = @"Jerry";
        NSLog(@"\n block内部：------------------------------------\n\
              a指向的堆中地址：%p；a在栈中的指针地址：%p", a, &a);               //a在栈区
        //a = [NSMutableString stringWithString:@"William"];
        /*
         当没有使用__block 块也会被拷贝到堆中,那么为什么不能改a值;
         原因可能是此时此时a是被block捕获.当变量进入block就进入新的作用域;为了区别其他的作用域 所以不能修改;
         */
        NSLog(@"\n blockValue:%@",a);
    };
    foo();
    NSLog(@"\n 定以后：------------------------------------\n\
          a指向的堆中地址：%p；a在栈中的指针地址：%p", a, &a);               //a在栈区
    NSLog(@"\n 定义以后:%@",a);
    
    return;
}
//利用imageNamed创建的图片什么时候释放



@end
