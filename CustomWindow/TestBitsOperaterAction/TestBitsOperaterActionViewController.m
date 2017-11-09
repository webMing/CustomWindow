//
//  TestBitsOperaterActionViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2017/11/5.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "TestBitsOperaterActionViewController.h"

/*
 当使用位段时候 虽然方法赋值，但是最后提交数据的时候无法方便的遍历出来只能一个一个取
 */
typedef struct bits {
    unsigned bit_1:1;
    unsigned bit_2:1;
    unsigned bit_3:1;
    unsigned bit_4:1;
    unsigned bit_5:1;
} bits;
/*
 使用options时候虽然可以使用位移取出各个位，但赋值的时候有点不方便
 */
typedef NS_OPTIONS(NSUInteger, SteBitsOptionsOperation) {
    SteBitsOptionsOperationType1 = 1 << 0,
    SteBitsOptionsOperationType2 = 1 << 1,
    SteBitsOptionsOperationType3 = 1 << 2,
    SteBitsOptionsOperationType4 = 1 << 3,
};

@interface TestBitsOperaterActionViewController (){
    bits _bits;
}
@property (assign, nonatomic) SteBitsOptionsOperation option;
@property (assign, nonatomic) unsigned int num;
@end

@implementation TestBitsOperaterActionViewController

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- CreateUI

- (void)configureData {
    self.option = 0x0;
    self.num = 0x0;
    _bits.bit_1 = 1;
}

#pragma mark- EventRespone
/*
 * 位段
 */
- (IBAction)bitFiledValueChange:(UISwitch*)sender {
    if (sender.on) {
        _bits.bit_1 = 1;
    }else{
        _bits.bit_1 = 0;
    }
   
}

/*
 * option
 */
- (IBAction)option1ValueChange:(UISwitch *)sender {
    if (sender.on) {
        self.option = self.option | SteBitsOptionsOperationType2;
    }else{
        self.option = self.option & (~SteBitsOptionsOperationType2);
    }
}

/*
 * option
 */
- (IBAction)option2ValueChange:(UISwitch *)sender {
    if (sender.on) {
        self.option = self.option | SteBitsOptionsOperationType4;
    }else{
        self.option = self.option & (~SteBitsOptionsOperationType4);
    }
}

/*
 * 提交
 */
- (IBAction)submit:(id)sender {
    
    //NSLog(@"_bits.bit_1:%d",_bits.bit_1);
    NSLog(@"%@", [self toBinaryNumWith:self.option]);
    
}

- (NSString*)toBinaryNumWith:(NSUInteger)num {
    NSUInteger chu= num;
    NSUInteger yu = 0;
    NSMutableArray* mutArray = @[].mutableCopy;
    while (chu != 0) {
        yu  = chu %2;
        chu = chu /2;
        [mutArray addObject:[NSString stringWithFormat:@"%ld",(unsigned long)yu]];
    }
    NSMutableString* mutStr = @"".mutableCopy;
    for (int i = 0 ; i < mutArray.count; i++) {
        //反序列
        [mutStr appendString:mutArray[mutArray.count - i - 1]];
    }
    return mutStr.copy;
    //return mutArray.reverseObjectEnumerator.allObjects;
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

- (void)testIndexSet {
    NSMutableIndexSet* set = [[NSMutableIndexSet alloc]init];
    [set addIndex:1];
    [set addIndex:5];
    [set addIndex:3];
    [set addIndex:9];
    [set removeIndex:1];
    [set enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%ld",idx);
    }];
}


@end
