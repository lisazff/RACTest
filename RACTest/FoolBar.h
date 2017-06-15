//
//  FoolBar.h
//  RACTest
//
//  Created by lisa on 2017/6/6.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoolBar : NSObject

- (void)makeFool:(void(^)(NSString *))callback; // 对象实例方法   一个无返回值 形参为 NSString的  block
@end
