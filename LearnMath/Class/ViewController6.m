//
//  ViewController6.m
//  LearnMath
//
//  Created by 车 on 2019/3/12.
//  Copyright © 2019 车. All rights reserved.
//

#import "ViewController6.h"

@interface ViewController6 ()

@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];

    self.questionDescription = @"归并排序的时候，为什么每次讲原有的数组分解为两组，而不是更多组呢，如果分为更多是否可行？";
    
    [self example1];
}

/**
 使用归并排序对数组进行排序
 */
- (void)example1 {
    NSArray *sortedArray = @[@123, @7, @2, @333, @1];
    NSArray *array = [self sortArray:sortedArray];
    NSLog(@"\n%@ \n%@", sortedArray, array);
}

- (NSArray *)sortArray:(NSArray *)sortedArray {
    if (sortedArray.count <= 1) return sortedArray;
    
    NSInteger middle = ceil(sortedArray.count / 2);
    NSArray *leftArray = [sortedArray subarrayWithRange:NSMakeRange(0, middle)];
    NSArray *rightArray = [sortedArray subarrayWithRange:NSMakeRange(middle, sortedArray.count - middle)];
    
    leftArray = [self sortArray:leftArray];
    rightArray = [self sortArray:rightArray];
    
    NSArray *mergeArray = [self mergeLeftArray:leftArray rightArray:rightArray];
    
    return mergeArray;
}

- (NSArray *)mergeLeftArray:(NSArray *)leftArray rightArray:(NSArray *)rightArray {
    if (leftArray.count == 0) return rightArray;
    if (rightArray.count == 0) return leftArray;
    
    NSMutableArray *array = [NSMutableArray array];
    
    NSInteger ai = 0;
    NSInteger bi = 0;
    while (ai < rightArray.count && bi < leftArray.count) {
        NSNumber *a = leftArray[ai];
        NSNumber *b = rightArray[bi];
        
        if (a.integerValue < b.integerValue) {
            [array addObject:a];
            ai++;
        } else {
            [array addObject:b];
            bi++;
        }
    }
    
    if (ai < leftArray.count) {
        [array addObjectsFromArray:[leftArray subarrayWithRange:NSMakeRange(ai, leftArray.count - ai)]];
    }
    if (bi < rightArray.count) {
        [array addObjectsFromArray:[rightArray subarrayWithRange:NSMakeRange(bi, rightArray.count - bi)]];
    }
    
    return array;
}
@end
