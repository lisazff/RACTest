//
//  NSObject+Caculator.m
//  RACTest
//
//  Created by lisa on 2017/6/6.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import "NSObject+Caculator.h"
#import "CaculatorMaker.h"
@implementation NSObject (Caculator)

+ (int)makeCaculators:(void (^)(CaculatorMaker *))caculatorMaker
{
    //创建计算管理者
    CaculatorMaker *mgr = [[CaculatorMaker alloc]init]; //初始化一个实例对象 因block 需要一个该类型的参数
    
    caculatorMaker(mgr); // 形参block的 实际调用
    
    return  mgr.result; //函数的返回值
}
@end
