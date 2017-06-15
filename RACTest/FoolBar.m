//
//  FoolBar.m
//  RACTest
//
//  Created by lisa on 2017/6/6.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import "FoolBar.h"

@implementation FoolBar


- (void)makeFool:(void (^)(NSString *))callback
{
    NSLog(@"makeFool | callback.");
    callback(@"This is a block parameter.");  //callback 是个代码块 参数  类似匿名函数  直接匿名函数调用   此时 真正会回到原来绑定的代码 进行逻辑处理
}

@end
