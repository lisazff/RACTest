//
//  ViewController.m
//  RACTest
//
//  Created by lisa on 2017/6/5.
//  Copyright © 2017年 lisa. All rights reserved.
//


//将Block Object 当作参数，在方法之间传递，调用


/**
 整型 转换成字符串
 
 typedef 把 block 的名字  定义成了一种数据类型 IntToStringConverter
 
 */
typedef NSString* (^IntToStringConverter)(NSUInteger paramInteger);  //
#import "ViewController.h"
#import "CaculatorMaker.h"
#import "NSObject+Caculator.h"
#import "FoolBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self testBlock];
    
//    [self test03];
    
    
 }

- (void)test05
{
    FoolBar *fb = [[FoolBar alloc] init];
    [fb makeFool:^(NSString *param) {  //对象 fb 调用方法 makeFool 把 参数（代码块） 传过去
        NSLog(@"param = %@", param);
    }];
  
}

- (void)RACtest
{
    // RACSignal使用步骤：
    // 1.创建信号 + (RACSignal *)createSignal:(RACDisposable * (^)(id<RACSubscriber> subscriber))didSubscribe
    // 2.订阅信号,才会激活信号. - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
    // 3.发送信号 - (void)sendNext:(id)value
    
    
    // RACSignal底层实现：
    // 1.创建信号，首先把didSubscribe保存到信号中，还不会触发。
    // 2.当信号被订阅，也就是调用signal的subscribeNext:nextBlock
    // 2.2 subscribeNext内部会创建订阅者subscriber，并且把nextBlock保存到subscriber中。
    // 2.1 subscribeNext内部会调用siganl的didSubscribe
    // 3.siganl的didSubscribe中调用[subscriber sendNext:@1];
    // 3.1 sendNext底层其实就是执行subscriber的nextBlock
    
    // 1.创建信号
    RACSignal *siganl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        // block调用时刻：每当有订阅者订阅信号，就会调用block。
        
        // 2.发送信号
        [subscriber sendNext:@1];
        
        // 如果不在发送数据，最好发送信号完成，内部会自动调用[RACDisposable disposable]取消订阅信号。
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            
            // block调用时刻：当信号发送完成或者发送错误，就会自动执行这个block,取消订阅信号。
            
            // 执行完Block后，当前信号就不在被订阅了。
            
            NSLog(@"信号被销毁");
            
        }];
    }];
    
    // 3.订阅信号,才会激活信号.
    [siganl subscribeNext:^(id x) {
        // block调用时刻：每当有信号发出数据，就会调用block.
        NSLog(@"接收到数据:%@",x);
    }];
 
}

- (void)test03
{
    int result = [NSObject makeCaculators:^(CaculatorMaker *make) { // 绑定好以后想要做的事情  make是一个对象
        
        make.add(1).add(3);
    }];
    
    NSLog(@"result:  %d",result);
 
}
- (void)testParamBlock
{
    //调用使用Block为参数的方法
    
    //    NSString* (^intToString)(NSUInteger) = ^(NSUInteger paramInteger){
    //        NSString *result = [NSString stringWithFormat:@"%u",(unsigned)paramInteger];
    //        return result;
    //    };
    
    //    NSString *result = [self convertIntToString:123 usingBlockObject:intToString];
    
    NSString *result = [self convertIntToString:123 usingBlockObject:^(NSUInteger paramInteger){
        NSString *result = [NSString stringWithFormat:@"%u",(unsigned)paramInteger];
        return result;
    }];
    NSLog(@"result = %@", result);
  
}
//定义使用Block为参数的函数

- (NSString *)convertIntToString:(NSUInteger)paramInteger usingBlockObject:(IntToStringConverter)paramBlockObject
{  // paramInteger 是代转话的 整型
    
    return paramBlockObject(paramInteger);
}






// 测试block 作为函数的参数
- (void)testBlock
{
    [self blockDemo1:^{
        [self afterCompletion];
    }];     //  ^{[self afterCompletion];} 是函数blockDemo1 的实参
    
}

-(void)blockDemo1:(void(^)() )completion{  // completion 是个无参无返回值的  形参
    NSLog(@"this is a no-param block");
    if(completion)
        completion();
}

-(void)afterCompletion{
    NSLog(@"afterCompletion");
}



//- (void)testParameterBlock
//{
//    
//}
//-(void)blockDemo2:(NSString * (^)(NSInteger ) )completion{
//    
//    NSLog(@"this is a param and return value block");
//    
//    if (completion) {
//        completion(7);  //block 传递个实参 7
//    }
//    
//}



- (void)test01
{
    //创建信号测试
    RACSignal *pipeline = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@(1)];
        [subscriber sendNext:@(2)];
        [subscriber sendNext:@(3)];
        
        [subscriber sendCompleted];
        
        return[RACDisposable disposableWithBlock:^{ // (2)
            NSLog(@"the pipeline has sent 3 values, and has been stopped");
        }];
        
    }];

}

@end
