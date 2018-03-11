//
//  SteKeyValueColor.m
//  CustomWindow
//
//  Created by Stephanie on 2018/3/1.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteKeyValueColor.h"

@interface SteKeyValueColor()

@end

@implementation SteKeyValueColor
+ (NSSet*)keyPathsForValuesAffectingColor{
    return [NSSet setWithObjects:@"rValue",@"gValue",@"bValue",nil];
}
-( UIColor *)color {
    return [UIColor colorWithRed:self.rValue green:self.gValue blue:self.bValue alpha:1.0];
}
@end
