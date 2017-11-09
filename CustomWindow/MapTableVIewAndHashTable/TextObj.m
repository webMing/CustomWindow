//
//  TextObj.m
//  CustomWindow
//
//  Created by Stephanie on 2017/11/8.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "TextObj.h"

@implementation TextObj
- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

-(NSString*)description {
    return @"TextItem";
}

- (instancetype)copyWithZone:(NSZone *)zone {
    TextObj* item  = [TextObj new];
    item.cuId = self.cuId;
    return item;
}

-(NSUInteger)hash {
    // hash 值返回的是对象的地址;
    NSUInteger hash =  [super hash];
    NSLog(@"hashValue:%ld",hash);
    return hash;
}


@end
