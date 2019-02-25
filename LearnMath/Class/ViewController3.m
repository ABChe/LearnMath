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
    
    [self example1];
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


@end
