//
//  CaculatorMaker.m
//  RACTest
//
//  Created by lisa on 2017/6/6.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import "CaculatorMaker.h"

@implementation CaculatorMaker

- (CaculatorMaker *(^)(int))add{
    
    return ^CaculatorMaker *(int value){
        
        _result += value;
        
        return self;
    };
}
@end
