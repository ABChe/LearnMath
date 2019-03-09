//
//  ViewController5.m
//  LearnMath
//
//  Created by 车 on 2019/3/5.
//  Copyright © 2019 车. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@property (nonatomic, strong) NSMutableArray *amountArray;
@property (nonatomic, strong) NSArray *rewards;

@property (nonatomic, strong) NSMutableArray *numberArray;
@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];

    self.questionDescription = @"一个整数可以被分解为多个整数的乘积，例如 6 可以分解为 2*3。请使用递归方程的方法，为给定的整数n，找到k所有可能的分解（1在解中最多出现一次）。例如，输入8，输出可以是 1*8， 8*1，2*4，4*2，1*2*2*2，1*2*4，···";
    
//    [self example1];
    
    [self question];
}


/**
 钱币组合问题
 */
- (void)example1 {
    /*
     不限数量的 1元 2元 5元 10元 货币，考虑每次奖赏的金额和先后顺序，有多少种奖励总额为 10 元的方式。
     */
    self.amountArray = [NSMutableArray array];
    self.rewards = @[@1, @2, @5, @10];
    [self getWithTotalReward:10 resultArray:[NSMutableArray new]];
    NSLog(@"\n%ld \n%@", self.amountArray.count, self.amountArray);
}

- (void)getWithTotalReward:(NSInteger)totalReward resultArray:(NSMutableArray *)resultArray{
    if (totalReward == 0) {
        [self.amountArray addObject:resultArray];
        return;
    }
    else if (totalReward < 0) {
        return;
    }
    else {
        for (int i = 0; i < self.rewards.count; i++) {
            NSMutableArray *array = [NSMutableArray arrayWithArray:resultArray];
            NSNumber *num = self.rewards[i];
            [array addObject:num];
            [self getWithTotalReward:totalReward - num.integerValue resultArray:array];
        }
    }
}


#pragma mark -

/**
 整数分解问题
 */
- (void)question {
    self.numberArray = [NSMutableArray array];
    [self getWithNumber:8 resultArray:[NSMutableArray array]];
    NSLog(@"\n%ld \n%@", self.numberArray.count, self.numberArray);
}

- (void)getWithNumber:(NSInteger)number resultArray:(NSMutableArray *)resultArray{
    if (number == 1) {
        if (![resultArray containsObject:@1]) {
            [resultArray addObject:@1];
        }
        [self.numberArray addObject:resultArray];
        return;
    }
    else {
        NSInteger min, max;
        min = [resultArray containsObject:@1] ? 2 : 1;
        max = number;
        for (NSInteger i = min; i <= max; i++) {
            NSMutableArray *array = [NSMutableArray arrayWithArray:resultArray];
            [array addObject:[NSNumber numberWithInteger:i]];
            
            if (max % i != 0) {
                continue;
            } else {
                [self getWithNumber:(max / i) resultArray:array];
            }
        }
    }
}

@end
