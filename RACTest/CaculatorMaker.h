//
//  CaculatorMaker.h
//  RACTest
//
//  Created by lisa on 2017/6/6.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaculatorMaker : NSObject

@property (nonatomic, assign) int result;

// 加、减、乘、除

// 方法的返回值是block,block必须有返回值（本身对象），block参数（需要操作的值）
- (CaculatorMaker * (^)(int))add;  //方法名是 add  方法的返回值block: CaculatorMaker * (^)(int)   bloack的返回值是 对象本身类型 CaculatorMaker *
- (CaculatorMaker * (^)(int))sub;
- (CaculatorMaker * (^)(int))muilt;
- (CaculatorMaker * (^)(int))divide;


@end
