//
//  SteAPixelLine.m
//  CustomWindow
//
//  Created by Stephanie on 2018/4/22.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteAPixelLine.h"

@implementation SteAPixelLine
- (void)awakeFromNib {
    [super awakeFromNib];
    self.constant = 1.0 /[UIScreen mainScreen].scale;
}
@end
