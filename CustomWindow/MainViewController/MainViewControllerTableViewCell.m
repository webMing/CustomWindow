//
//  MainViewControllerTableViewCell.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/26.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "MainViewControllerTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface MainViewControllerTableViewCell()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mult;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end
@implementation MainViewControllerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //_imgView.contentMode = UIViewContentModeScaleAspectFit;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)configureWithStr:(NSString*)str {
    [self.imgView  sd_setImageWithURL:[NSURL URLWithString:str]];
}

- (void)configureWithImg:(UIImage*)img {
    self.imgView.image = img;
}

@end
