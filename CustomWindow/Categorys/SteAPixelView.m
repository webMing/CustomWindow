//
//  SteAPixelView.m
//  CustomWindow
//
//  Created by Stephanie on 2018/4/22.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteAPixelView.h"

#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

@interface SteAPixelView ()

@end

@implementation SteAPixelView

- (void)drawRect:(CGRect)rect {
    CGRect frame = self.frame;
    frame.origin.x = CGRectGetMinX(frame) - SINGLE_LINE_ADJUST_OFFSET;
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:frame];
    CAShapeLayer* shaperLayer = [CAShapeLayer layer];
    shaperLayer.fillColor = [UIColor blackColor].CGColor;
    shaperLayer.strokeColor = [UIColor blackColor].CGColor;
    shaperLayer.lineWidth = SINGLE_LINE_WIDTH;
    shaperLayer.path = path.CGPath;
    [self.layer insertSublayer:shaperLayer atIndex:0];
    
}


@end
