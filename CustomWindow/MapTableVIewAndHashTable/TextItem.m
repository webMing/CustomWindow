//
//  TextItem.m
//  CustomWindow
//
//  Created by Stephanie on 2017/11/8.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "TextItem.h"

static const NSUInteger SIZE = 30;

struct dataItem {
    int key;
    int value;
};

// 添加变量不然又可能造成方法冲突
static int hashCode(int key) {
    return key % SIZE;
}

@interface TextItem ()<NSCopying>
@end

@implementation TextItem

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

-(NSString*)description {
    return @"TextItem";
}

- (instancetype)copyWithZone:(NSZone *)zone {
    TextItem* item  = [TextItem new];
    item.cuId = self.cuId;
    return item;
}
@end
