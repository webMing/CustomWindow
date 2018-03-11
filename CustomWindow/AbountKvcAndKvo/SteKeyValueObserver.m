//
//  SteKeyValueObserver.m
//  CustomWindow
//
//  Created by Stephanie on 2018/3/1.
//  Copyright © 2018年 Stephanie. All rights reserved.
//
 //__attribute__((warn_unused_result)) 此选项方法方法后面；如果方法返回的对象没有被使用则会出现警告
#import <objc/runtime.h>
#import "SteKeyValueObserver.h"

@interface SteKeyValueObserver ()
@property (weak, nonatomic) id target;
@property (weak, nonatomic) id observedObj;
@property (copy, nonatomic) NSString* keyPath;
@property (nonatomic) SEL sel;
@end

@implementation SteKeyValueObserver
- (instancetype)initWithObservedObj:(id)obj keyPath:(NSString*)kp target:(id)tar options:(NSKeyValueObservingOptions)op selector:(SEL)sel {
    if (!obj || !tar) {
        return nil;
    }
    NSParameterAssert(tar != nil);
    NSParameterAssert([tar respondsToSelector:sel]);
    if (self = [super init]) {
        _target = tar;
        _observedObj = obj;
        _keyPath = kp;
        _sel = sel;
        [obj addObserver:self forKeyPath:kp options:op context:(__bridge void*)self];
        objc_setAssociatedObject(tar, (__bridge void *)(self),self, OBJC_ASSOCIATION_RETAIN);
    }
    return self;
}

+ (instancetype)observeObject:(id)obj keyPath:(NSString*)kp target:(id)tar selector:(SEL)sel {
   return [[self alloc]initWithObservedObj:obj keyPath:kp target:tar options:0 selector:sel];
}

+ (instancetype)observeObject:(id)obj keyPath:(NSString*)kp target:(id)tar option:(NSKeyValueObservingOptions)op selector:(SEL)sel {
   return [[self alloc]initWithObservedObj:obj keyPath:kp target:tar options:op selector:sel];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == (__bridge void*)self) {
        [self didChange:change];
    }
}

- (void)didChange:(NSDictionary *)change;
{
    id strongTarget = self.target;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [strongTarget performSelector:self.sel withObject:change];
#pragma clang diagnostic pop
}

- (void)dealloc {
    [self.observedObj removeObserver:self forKeyPath:self.keyPath];
}

@end
