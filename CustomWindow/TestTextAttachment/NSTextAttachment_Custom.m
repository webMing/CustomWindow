//
//  Custom.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/30.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "NSTextAttachment_Custom.h"
@implementation NSTextAttachment(Custom)
- (CGRect)configureAttmentRectWithX:(CGFloat)x Y:(CGFloat)y Height:(CGFloat)height {
     return CGRectMake(x, y, self.image.size.width * height /self.image.size.height, height);
}
@end
