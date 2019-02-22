//
//  ViewController2.m
//  LearnMath
//
//  Created by 车 on 2019/1/29.
//  Copyright © 2019 车. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];

    self.questionDescription = @"生活中有哪些用到了余数的思想";
    
    NSInteger number = 625;
    NSInteger randomNumber = 590127;
    
    NSString *encryptedNumberString = [self encryptNumber:number randomNumber:randomNumber];
    NSArray *decryptedNumberArray = [self decryptNumber:encryptedNumberString.integerValue
                                           randomNumber:randomNumber];
    
    NSString *numberString = [NSString stringWithFormat:@"%ld", number];
    
    BOOL result = [decryptedNumberArray containsObject:numberString];
    NSString *resultString = result ? @"成功" : @"失败";
    
    NSLog(@"\n加密前的数字:%@ \n加密后的数字:%@ \n解密后的数字:%@ \n结果:%@", numberString, encryptedNumberString, decryptedNumberArray, resultString);
}

- (NSString *)encryptNumber:(NSInteger)number randomNumber:(NSInteger)randomNumber {
    NSString *numberString = [NSString stringWithFormat:@"%ld", number];
    
    if (numberString.length != 3 || number < 100) return 0;

    char array[6];
    memcpy(array, [numberString cStringUsingEncoding:NSASCIIStringEncoding], 2 * numberString.length);
    
    NSInteger a, b, c;
    a = [[NSString stringWithFormat:@"%c", array[0]] integerValue];
    b = [[NSString stringWithFormat:@"%c", array[1]] integerValue];
    c = [[NSString stringWithFormat:@"%c", array[2]] integerValue];
    
    a = (a + randomNumber) % 7;
    b = (b + randomNumber) % 7;
    c = (c + randomNumber) % 7;
    
    a = a + c;
    c = a - c;
    a = a - c;
    
    NSString *result = [NSString stringWithFormat:@"%ld%ld%ld", a, b, c];
    return result;
}

- (NSArray *)decryptNumber:(NSInteger)number randomNumber:(NSInteger)randomNumber {
    NSInteger a, b, c;
    a = number / 100;
    b = number / 10 % 10;
    c = number % 10;
    
    // 交换百位和个位 514
    a = a - c;
    c = c + a;
    a = c - a;
    
    NSInteger d = randomNumber / 7;
    NSInteger e = randomNumber - d * 7;
    
    NSMutableArray *aArray = [NSMutableArray array];
    for (int i = 1; i < 10; i++) {
        if ((i + e) % 7 == a) {
            [aArray addObject:@(i)];
        }
    }
    NSMutableArray *bArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        if ((i + e) % 7 == b) {
            [bArray addObject:@(i)];
        }
    }
    NSMutableArray *cArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        if ((i + e) % 7 == c) {
            [cArray addObject:@(i)];
        }
    }
    
    NSMutableArray *resultArray = [NSMutableArray array];
    for (NSNumber *aNumber in aArray) {
        for (NSNumber *bNumber in bArray) {
            for (NSNumber *cNumber in cArray) {
                NSString *resultString = [NSString stringWithFormat:@"%@%@%@", aNumber, bNumber, cNumber];
                [resultArray addObject:resultString];
            }
        }
    }
    
    return resultArray;
}

@end
