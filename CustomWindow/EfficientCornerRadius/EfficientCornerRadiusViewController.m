//
//  EfficientCornerRadiusViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2018/4/17.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "EfficientCornerRadiusViewController.h"

@interface EfficientCornerRadiusViewController ()
@property (weak, nonatomic) IBOutlet UIButton *textBtn;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@end

@implementation EfficientCornerRadiusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self congiureLabelLayer];
    [self configureBtnLayer];
}

- (void)congiureLabelLayer {
    
    /*cornerRadius属性:它是影响layer显示的backgroundColor和border，对layer的contents不起作用
     也就是说如果设置label的backgroundColor为其他的显眼的颜色,那么设置layer的cornerRadius将失效,
     如果使用masksToBounds=YSE,会导致离屏渲染.
     */
    
    /*
     对于需要同时设置label的backgroundColor时，直接设置cornerRadius是不能正常显示圆角的，原因是：UILabel设置backgroundColor的行为，不再是设定layer的背景色而是为contents设置背景色。所以解决方式是我们不去设置label的backgroundColor，而是直接设置label.layer.backgroundColor，这样就可以实现单独设置cornerRadius，显示圆角的效果。
     */
    self.textLabel.layer.cornerRadius = 8.5f;
    self.textLabel.layer.borderColor = [UIColor redColor].CGColor;
    self.textLabel.layer.borderWidth = 1.f;
    self.textLabel.layer.backgroundColor = [UIColor greenColor].CGColor;
    for (CALayer* layer in self.textLabel.layer.sublayers) {
        NSLog(@"layer:%@",layer);//label没有其他的layer
    }
   
}

- (void)configureBtnLayer {
    /*btn可以直接设置，可以正常显示*/
    self.textBtn.layer.cornerRadius = 8.5f;
    self.textBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.textBtn.layer.borderWidth = 0.f;
    /*当然也可以设置layer backgroundColor ；注意设置btn layer会直接覆盖btn.backgroundColor*/
    self.textBtn.layer.backgroundColor = [UIColor greenColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
