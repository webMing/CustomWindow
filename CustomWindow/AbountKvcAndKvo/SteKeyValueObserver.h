//
//  SteKeyValueObserver.h
//  CustomWindow
//
//  Created by Stephanie on 2018/3/1.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SteKeyValueObserver : NSObject
+ (instancetype)observeObject:(id)obj keyPath:(NSString*)kp target:(id)tar selector:(SEL)sel;
+ (instancetype)observeObject:(id)obj keyPath:(NSString*)kp target:(id)tar option:(NSKeyValueObservingOptions)op selector:(SEL)sel;
@end
