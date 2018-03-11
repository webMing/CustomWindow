//
//  SteKeyValueColor.h
//  CustomWindow
//
//  Created by Stephanie on 2018/3/1.
//  Copyright © 2018年 Stephanie. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SteKeyValueColor : NSObject
@property (nonatomic, assign) float rValue;
@property (nonatomic, assign) float gValue;
@property (nonatomic, assign) float bValue;
@property (nonatomic, strong, readonly) UIColor* color;
@end
