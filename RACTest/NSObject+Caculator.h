//
//  NSObject+Caculator.h
//  RACTest
//
//  Created by lisa on 2017/6/6.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CaculatorMaker;
@interface NSObject (Caculator)

//计算

+ (int)makeCaculators:(void(^)(CaculatorMaker *make))caculatorMaker;
@end
