//
//  ViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/13.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "MainViewController.h"
#import "CustomViewController.h"
#import "UIViewController+SteShowCustomWindow.h"
#import "MainViewControllerTableViewCell.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray* imgsMutArray;
@property (strong, nonatomic) NSMutableDictionary* imgsMutDict;
@end

@implementation MainViewController

#pragma mark- LifeCicle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //self.tableView.estimatedRowHeight = 88.0f;
    //self.tableView.rowHeight = UITableViewAutomaticDimension;
    NSMutableArray* imgUrlStrsArray = @[].mutableCopy;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"x" ofType:@"txt"];
    NSString *string = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *array = [string componentsSeparatedByString:@"\n"];
    for (NSString *obj in array) {
        [imgUrlStrsArray addObject:obj];
        if ([obj containsString:@"http"] && [obj containsString:@"_240x426"] && ![obj containsString:@"_480x852"]) {
            [imgUrlStrsArray addObject:obj];
        }
    }
    self.imgsMutArray = imgUrlStrsArray;
    /*
    // 保证图片保存顺序是imgUrlStrsArray 顺序
    self.imgsMutArray = NSMutableArray.new;
    self.imgsMutDict = NSMutableDictionary.new;
    dispatch_queue_t queue = dispatch_queue_create("www.stephanie.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    [imgUrlStrsArray enumerateObjectsUsingBlock:^(NSString* urlStr, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_group_async(group, queue, ^{
            // 块会捕获 idx.
            NSData* imgData =  [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
            UIImage* img = [UIImage imageWithData:imgData];
            if (img) {
                [self.imgsMutArray addObject:img];
                [self.imgsMutDict setValue:img forKey:[NSString stringWithFormat:@"%ld",idx]];
            }
        });
    }];
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
     */
    [self.tableView  reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- CreateUI

#pragma mark- EventRespone
- (IBAction)showViewControllerAction:(id)sender {
    CustomViewController* vc = [CustomViewController new];
    [self showSteWinWithViewController:vc animate:YES];
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.imgsMutArray.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSString* key = [NSString stringWithFormat:@"%ld",indexPath.row];
    //UIImage* img = [self.imgsMutDict objectForKey:key];
    //[((MainViewControllerTableViewCell*)cell) configureWithImg:img];
  [((MainViewControllerTableViewCell*)cell) configureWithStr:self.imgsMutArray[indexPath.row]];
  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* key = [NSString stringWithFormat:@"%ld",indexPath.row];
    UIImage* img = [self.imgsMutDict objectForKey:key];
    NSInteger imgH = img.size.height;
    NSInteger imgW = img.size.width;
    return 100;
    if (imgW > CGRectGetWidth(self.view.bounds)) {
        return imgH * CGRectGetWidth(self.view.bounds) / imgW;
    }
    return imgH + 1;
}
//imgh sh
//imgw sw
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UIImage* image = [UIImage imageNamed:@"20140320225429296"];
//    CGFloat itemW = CGRectGetWidth(self.view.bounds);
//    return (image.size.height * itemW / image.size.width);
//}

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod




@end
