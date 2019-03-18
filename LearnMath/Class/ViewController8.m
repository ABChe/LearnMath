//
//  ViewController8.m
//  LearnMath
//
//  Created by 车 on 2019/3/18.
//  Copyright © 2019 车. All rights reserved.
//

#import "ViewController8.h"

@interface ViewController8 ()

@property (nonatomic, strong) NSMutableArray *numberCombineArray;

@end

@implementation ViewController8

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self example1];
}


#pragma mark -

/**
 元素组合
 */
- (void)example1 {
    self.numberCombineArray = [NSMutableArray array];
    NSArray *numberArray = @[@"t1", @"t2", @"t3", @"t4"];
    NSInteger elementCount = 3;
    
    [self combineFromNumberArray:numberArray
                    elementCount:elementCount
                     resultArray:@[]
                totalResultArray:self.numberCombineArray];
    
    NSLog(@"\n%@", self.numberCombineArray);
}


/**
 获取元素所有组合

 @param numberArray 所有元素
 @param elementCount 一种组合的元素个数
 @param resultArray 一种组合
 @param totalResultArray 所有组合
 */
- (void)combineFromNumberArray:(NSArray *)numberArray elementCount:(NSInteger)elementCount resultArray:(NSArray *)resultArray totalResultArray:(NSMutableArray *)totalResultArray {
    if (resultArray.count == elementCount) {
        [totalResultArray addObject:resultArray];
        return;
    }
    
    for (int i = 0; i <numberArray.count ; i++) {
        NSMutableArray *resultArr = [NSMutableArray arrayWithArray:resultArray];
        [resultArr addObject:numberArray[i]];
        
        NSArray *remainArray = [numberArray subarrayWithRange:NSMakeRange(i + 1, numberArray.count - i - 1)];
        NSMutableArray *numberArr = [NSMutableArray arrayWithArray:remainArray];
        
        [self combineFromNumberArray:numberArr
                        elementCount:elementCount
                         resultArray:resultArr
                    totalResultArray:totalResultArray];
    }
}


#pragma mark -

@end
