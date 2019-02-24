//
//  ViewController1.m
//  LearnMath
//
//  Created by 车 on 2019/1/29.
//  Copyright © 2019 车. All rights reserved.
//

#import "ViewController1.h"

@interface NSString (Reverse)

- (NSString *)reverse;
@end

@implementation NSString (Reverse)

- (NSString *)reverse {
    NSMutableString *reverseString = [[NSMutableString alloc] initWithCapacity:self.length];

    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
                              [reverseString appendString:substring];
                          }];
    
    NSString *string = [NSString stringWithString:reverseString];
    return string;
}
@end


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
