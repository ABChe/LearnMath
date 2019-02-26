//
//  ViewController3.m
//  LearnMath
//
//  Created by 车 on 2019/2/24.
//  Copyright © 2019 车. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.questionDescription = @"在你曾经的项目中是否用过迭代法？如果有，你觉得迭代法最大的特点是什么？如果没用过，你想想看现在的项目中是否有可以使用的地方？";
    
//    [self example1];
    [self example2];
}


#pragma mark -

/**
 麦子
 */
- (void)example1 {
    /*
     64格的国际象棋，第一格放一粒麦子，第二个两粒，之后每一格是前一格的两倍。
     问：放满 64 格需要多少麦子？
     */
    NSInteger gridNumber = 64;
    CGFloat wheatNumber = [self getNumberOfWheatToGridNumber:gridNumber];
    NSLog(@"\n填满%ld格子需要%f粒麦子", gridNumber, wheatNumber);
}

- (CGFloat)getNumberOfWheatToGridNumber:(NSInteger)gridNumber {
    // 总数
    CGFloat sum = 0;
    // 当前格子麦子数
    CGFloat currentNumberOfWheat = 1;
    
    sum += currentNumberOfWheat;
    
    for (int i = 2; i <= gridNumber; i++) {
        currentNumberOfWheat *= 2;
        sum += currentNumberOfWheat;
    }
    
    return sum;
}


#pragma mark -


/**
 求方程的精确或者近似解
 */
- (void)example2 {
    /*
     给定一个大于 1 的正整数，求它的平方根
     */
    NSInteger number = 10.f;
    CGFloat deltaThreshould = 0.000001f;
    NSInteger maxtry = 100;
    
    CGFloat squreRoot = [self getSqureRootWithNumber:number deltaThreshould:deltaThreshould maxTry:maxtry];
    
    NSString *string;
    if (squreRoot == -1.f) {
        string = @"数值应大于1";
    } else if (squreRoot == -2.f) {
        string = @"未找到解";
    } else {
        string = [NSString stringWithFormat:@"%lf", squreRoot];
    }
    
    NSLog(@"正整数 %ld 的平方根为 %@", number, string);
}


/**
 计算大于 1 的正整数的平方根

 @param number 大于一的正整数
 @param deltaThreshould 误差的阈值
 @param maxTry 二分查找的最大次数
 */
- (CGFloat)getSqureRootWithNumber:(NSInteger)number deltaThreshould:(CGFloat)deltaThreshould maxTry:(NSInteger)maxTry {
    
    if (number <= 1) return -1.f;
    
    CGFloat min = 1.f;
    CGFloat max = (CGFloat)number;
    
    for (int i = 0; i < maxTry; i++) {
        CGFloat middle = (min + max) / 2;
        CGFloat delta = fabs(pow(middle, 2) / number - 1);
        
        if (delta <=deltaThreshould) {
            // 满足精度要求
            return middle;
        }
        else {
            if (pow(middle, 2) > number) {
                // 左半边
                max = middle;
            } else {
                // 右半边
                min = middle;
            }
        }
        
//        if (i == maxTry - 1) {
//            return middle;
//        }
    }
    return -2.f;
}

@end
