//
//  MapTableVIewAndHashTableViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2017/11/6.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "MapTableVIewAndHashTableViewController.h"
#import "TextItem.h"
#import "TextObj.h"

@interface MapTableVIewAndHashTableViewController ()
@property (strong, nonatomic) NSPointerArray*  pointerArray;
@property (strong, nonatomic) NSHashTable* hashTable;
@property (strong, nonatomic) NSMapTable* mapTable;
@property (strong, nonatomic) TextItem* fItem;
@end

@implementation MapTableVIewAndHashTableViewController


#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self testPointerArray];
    //[self testHashTable];
    [self testMapTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testPointerArray {
    
    TextItem* fItem = [TextItem new];
    fItem.cuId = @"Item";
    //self.fItem = fItem; //外部强引用对象
    TextObj* sItem = [TextObj new];
    sItem.cuId = @"Item";
    /*NSPointerFunctionsWeakMemory :若引用对象
     *NSPointerFunctionsStrongMemory:强引用对象
     *NSPointerFunctionsCopyIn:拷贝的对象必须实现copying协议
     *NSPointerFunctionsWeakMemory 不能与 NSPointerFunctionsWeakMemory 和 NSPointerFunctionsOpaquePersonality同时使用
     *
     */
    self.pointerArray = [NSPointerArray pointerArrayWithOptions:NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPersonality];
    [self.pointerArray addPointer:(void*)fItem];
    [self.pointerArray addPointer:(void*)sItem];
    
}

- (void)testHashTable {
    
    /*NSHashTableWeakMemory :若引用对象
     *NSPointerFunctionsStrongMemory:强引用对象
     *NSHashTableCopyIn 不能和NSHashTableWeakMemory 同时使用
     *NSHashTableWeakMemory:对象要实现Copying协议
     *NSPointerFunctionsObjectPointerPersonality : Use shifted pointer for the hash value and direct comparison to determine equality; use the description method for a description.
     *NSPointerFunctionsOpaquePersonality : Use shifted pointer for the hash value and direct comparison to determine equality.
     *NSPointerFunctionsObjectPersonality : Use hash and isEqual methods for hashing and equality comparisons, use the description method for a description.
     关于Hash知识点:系统提供的hash是根据内容地址计算出来的;实际应用中应该根据具体业务的需要来实现自己hash函数.
     */
    self.hashTable = [NSHashTable hashTableWithOptions:NSHashTableStrongMemory|NSPointerFunctionsObjectPersonality];
    TextObj* fItem = [TextObj new];
    fItem.cuId = @"Item";
    TextObj* sItem = [TextObj new];
    sItem.cuId = @"Item";
    [self.hashTable addObject:fItem];
    [self.hashTable addObject:sItem];
    [self.hashTable addObject:fItem];
    
    NSString *string1 = @"yyb";
    NSString *string2 = @"nijino";
    //这里打印内容要用无符号来显示,会出现负值;
    NSLog(@"string1 hash %ld",[string1 hash]);
    NSLog(@"string2 hash %ld",[string2 hash]);

    NSMutableSet* mutSet = [NSMutableSet set];
    [mutSet addObject:fItem];
    [mutSet addObject:sItem];
    if ([fItem isEqual:sItem]) {
        // 这里的值应该是不相等的e;
        NSLog(@"fItem isEqual sItem");
    }
    
}

- (void)testMapTable {
    self.mapTable = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsObjectPersonality valueOptions:NSPointerFunctionsObjectPersonality];
    TextObj* fItem = [TextObj new];
    [self.mapTable setObject:fItem forKey:fItem];
    TextObj* sItem = [TextObj new];
    [self.mapTable setObject:sItem forKey:sItem];
    //判断相同的时候只有 hash值和isEqual 同时为真时候;才返回真值;
}
- (void)testMethod {
    NSLog(@"code excute!");
}

#pragma mark- CreateUI

#pragma mark- EventRespone

- (IBAction)subAction:(UIButton *)sender {
    /*
    TextItem* textItem = self.pointerArray.allObjects[0];
    TextObj* testObj = self.pointerArray.allObjects[1];
    if ([textItem isEqual:testObj]) {
        NSLog(@"Equal");
    }
    //NSLog(@"%@",self.pointerArray.allObjects);
     */
    
    //TextItem* item = self.hashTable[0];
     
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

@end
