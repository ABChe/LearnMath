//
//  ViewController1.m
//  LearnMath
//
//  Created by 车 on 2019/1/29.
//  Copyright © 2019 车. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];

    self.questionDescription = @"如何自己实现一个十进制转二进制的方法";
    
    NSInteger number = 98;
    
    NSString *string = [self convertDecimalToBinary:number];
    
    NSLog(@"\n十进制数字：%ld \n转换成二进制为：%@", number, string);
}

- (NSString *)convertDecimalToBinary:(NSInteger)decimalNumber {
    NSMutableString *binaryString = [NSMutableString new];
    
    while (decimalNumber) {
        [binaryString appendString:[NSString stringWithFormat:@"%ld", (decimalNumber & 1)]];
        decimalNumber = decimalNumber >> 1;
    }

    NSString *string = [NSString stringWithString:[binaryString reverse]];
    return string;
}

@end
