//
//  LearnOutLetsCustomView.m
//  CustomWindow
//  Created by Stephanie on 2017/11/11.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "LearnOutLetsCustomView.h"
/*
 * 技巧:先在头文件中或者分类中定义好属性;然后在XIB中拉去属性即可;
 * (项目中有图片上传的公共类,要根据图片数量动态改变collectionView高度；可以在类中添加一个高度Constraint然后嵌入到VC.view 中动态改变View高度; 建议不要这么干,以提高模块高复用度/)
 */
@interface LearnOutLetsCustomView ()
@property (weak, nonatomic) IBOutlet UILabel* firstLb;
@property (weak, nonatomic) IBOutlet UILabel* secondLb;
@end

@implementation LearnOutLetsCustomView

@end
