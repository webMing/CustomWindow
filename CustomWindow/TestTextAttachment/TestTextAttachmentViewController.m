//
//  TestTextAttachmentViewController.m
//  CustomWindow
//
//  Created by Stephanie on 2017/10/30.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#import "TestTextAttachmentViewController.h"
#import "NSTextAttachment_Custom.h"
#import "NSString+Custom.h"
//全局块类似单例/
void (^block)(NSInteger var) = ^(NSInteger var) {
    var = 4;
    NSLog(@"var Value:%ld",(long)var);
};

@interface TestTextAttachmentViewController () {
    NSString* _a;
}
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (copy, nonatomic) NSString* name;
@property (copy, nonatomic) NSString* now;
@end

@implementation TestTextAttachmentViewController
@synthesize name = _name;

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self configureUI];
//    [self setValue:@"dfd" forKey:@"_a"];
//    [self testRetainCircle ];
//    NSLog(@"a vlaue:%@",_a);
//    [self testBlock];
//    [self testBlock2];
//    [self testObserver];
  
    NSString* aStr = @"🙂";
    [aStr isNoBlack];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- CreateUI

#pragma mark- ConfigureUI

- (void)configureUI {
    
    NSMutableAttributedString* mutAttrStr = [[NSMutableAttributedString alloc]initWithString:@"Tomorow is better " attributes:@{NSForegroundColorAttributeName:UIColor.lightGrayColor}];
    NSTextAttachment* attm = [[NSTextAttachment alloc]init];
    attm.image = [UIImage imageNamed:@"green-positioning"];
    attm.bounds = [attm configureAttmentRectWithX:0 Y:-3 Height:15];
    NSAttributedString* attmStr = [NSAttributedString attributedStringWithAttachment:attm];
    [mutAttrStr appendAttributedString:attmStr];
    self.contentLabel.attributedText = mutAttrStr;
    _contentLabel = nil;
    //含有表情符号时候；测试字符串含有空格是否正常工作
    NSString* eyeStr = @"👓d👓_😎fds我 日语  的世界";
//    for (int i = 0; i < eyeStr.length ; i++) {
//        NSLog(@"%c",[eyeStr characterAtIndex:i]);
//    }

    NSLog(@"%d",[eyeStr isContainBlack]);
    _name = @"this is all right!~";
}

- (void)testBlock {
    __block int a = 10;
    NSLog(@"定义前：%p",&a);
    void (^foo)(void) = ^{
//        a = 30;
        NSLog(@"block中:%p",&a);
    };
     NSLog(@"定义后:%p",&a);
    foo();
     NSLog(@"定义后:%p",&a);
    /*我们都知道：Block不允许修改外部变量的值，这里所说的外部变量的值，指的是栈中指针的内存地址。__block 所起到的作用就是只要观察到该变量被 block 所持有，就将“外部变量”在栈中的内存地址放到了堆中。进而在block内部也可以修改外部变量的值。
     Block不允许修改外部变量的值。Apple这样设计，应该是考虑到了block的特殊性，block也属于“函数”的范畴，变量进入block，实际就是已经改变了作用域。在几个作用域之间进行切换时，如果不加上这样的限制，变量的可维护性将大大降低。又比如我想在block内声明了一个与外部同名的变量，此时是允许呢还是不允许呢？只有加上了这样的限制，这样的情景才能实现。于是栈区变成了红灯区，堆区变成了绿灯区。*/
}

- (void)testBlock2 {
    NSMutableString *a = [NSMutableString stringWithString:@"Tom"];
    NSLog(@"\n 定以前：------------------------------------\n\
          a指向的堆中地址：%p；a在栈中的指针地址：%p", a, &a);               //a在栈区
    void (^foo)(void) = ^{
        a.string = @"Jerry";
        NSLog(@"\n block内部：------------------------------------\n\
              a指向的堆中地址：%p；a在栈中的指针地址：%p", a, &a);               //a在栈区
        /*没有添加block的时候 会对在栈区中的a进行拷贝；当进入block后就会block就把a在栈区的指针地址复制到复制到堆区了
         可以观察添加__block 前后a地址的变更*/
        //a = [NSMutableString stringWithString:@"William"];
    };
    foo();
    NSLog(@"\n 定以后：------------------------------------\n\
          a指向的堆中地址：%p；a在栈中的指针地址：%p", a, &a);
}


- (void)testRetainCircle {
    
    dispatch_queue_t que = dispatch_queue_create("www.baidu.com", DISPATCH_QUEUE_CONCURRENT );
    dispatch_group_t group = dispatch_group_create();
    __weak typeof(self) weakSelf = self;
    dispatch_group_async(group,que, ^
    {
        typeof(self) strongSelf = weakSelf;
        //[strongSelf doSomething];
        //[strongSelf doSomethingElse];
    } );
    
  
}

- (void)testObserver {
    [super viewDidLoad];
    [self addObserver:self forKeyPath:@"now" options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"1");
    [self willChangeValueForKey:@"now"]; // “手动触发self.now的KVO”，必写。
    NSLog(@"2");
    [self didChangeValueForKey:@"now"]; // “手动触发self.now的KVO”，必写。
    NSLog(@"4");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"3");
}
#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod
- (NSString*)name {
    return _name;
}
- (void)setName:(NSString *)name {
    _name = [name copy];
}
@end
