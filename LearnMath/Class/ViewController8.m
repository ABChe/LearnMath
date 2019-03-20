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
@property (nonatomic, strong) NSMutableDictionary *winnerCombineDic;

@end

@implementation ViewController8

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.questionDescription = @"假设现在需要一个抽奖系统。需要一次从 100 个人中，抽取三等奖 10 名，二等奖 3 名和一等奖 1 名。请列出所有可能组合，需要注意的没人最多只能被抽中一次。";
    
//    [self example1];
    [self question];
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


/**
 抽奖组合
 */
- (void)question {
    /*
     问题中数值过大结，改为 10 人抽奖：三等奖 3 名，二等奖 2名，一等奖 1 名。
     */
    NSInteger personCount = 10;
    NSInteger thirdPrizeCount = 3;
    NSInteger secondPrizeCount = 2;
    NSInteger firstPrizeCount = 1;
    NSMutableArray *totalResultArray = [NSMutableArray array];
    
    NSMutableArray *personArray = [NSMutableArray array];
    for (int i = 1; i <= personCount; i++) {
        NSNumber *personNumber = [NSNumber numberWithInt:i];
        [personArray addObject:personNumber];
    }
    
    NSMutableArray * thirdPrizeWinnerArray = [NSMutableArray array];
    [self combineFromPersonArray:personArray
                      prizeCount:thirdPrizeCount
                     resultArray:@[]
                totalResultArray:thirdPrizeWinnerArray];

    [thirdPrizeWinnerArray enumerateObjectsUsingBlock:^(NSArray *thirdChildArray, NSUInteger idx, BOOL * _Nonnull stop)
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        
        NSMutableArray *reminSecondPersonArray = [NSMutableArray arrayWithArray:personArray];
        [reminSecondPersonArray removeObjectsInArray:thirdChildArray];
        
        NSMutableArray * secondPrizeWinnerArray = [NSMutableArray array];
        [self combineFromPersonArray:reminSecondPersonArray
                          prizeCount:secondPrizeCount
                         resultArray:@[]
                    totalResultArray:secondPrizeWinnerArray];
        
        [secondPrizeWinnerArray enumerateObjectsUsingBlock:^(NSArray *secondChildArray, NSUInteger idx, BOOL * _Nonnull stop)
        {
            NSMutableArray *reminFirstPersonArray = [NSMutableArray arrayWithArray:reminSecondPersonArray];
            [reminFirstPersonArray removeObjectsInArray:secondChildArray];
    
            NSMutableArray * firstPrizeWinnerArray = [NSMutableArray array];
            [self combineFromPersonArray:reminFirstPersonArray
                              prizeCount:firstPrizeCount
                             resultArray:@[]
                        totalResultArray:firstPrizeWinnerArray];

            [firstPrizeWinnerArray enumerateObjectsUsingBlock:^(NSArray *firstChildArray, NSUInteger idx, BOOL * _Nonnull stop)
            {
                NSString *thirdWinnerString = [thirdChildArray componentsJoinedByString:@"-"];
                NSString *secondWinnerString = [secondChildArray componentsJoinedByString:@"-"];
                NSString *firstWinnerString = [firstChildArray componentsJoinedByString:@"-"];

                dic[@"1"] = firstWinnerString;
                dic[@"2"] = secondWinnerString;
                dic[@"3"] = thirdWinnerString;

                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:dic];
                [totalResultArray addObject:resultDic];
            }];
        }];
    }];

    NSLog(@"\n%ld \n%@", totalResultArray.count, totalResultArray);
}

/**
 所有获奖组合

 @param personArray 参与抽奖人员
 @param prizeCount 获奖人员总数
 @param resultArray 一种获奖组合
 @param totalResultArray 所有获奖组合
 */
- (void)combineFromPersonArray:(NSArray *)personArray prizeCount:(NSInteger)prizeCount resultArray:(NSArray *)resultArray totalResultArray:(NSMutableArray *)totalResultArray {
    if (prizeCount == 0) {
        [totalResultArray addObject:resultArray];
        return;
    }
    
    for (int i = 0; i <personArray.count ; i++) {
        NSMutableArray *resultArr = [NSMutableArray arrayWithArray:resultArray];
        [resultArr addObject:personArray[i]];
        
        NSInteger remainPrizeCount = prizeCount - 1;
        
        NSArray *remainArray = [personArray subarrayWithRange:NSMakeRange(i + 1, personArray.count - i - 1)];
        NSMutableArray *personArr = [NSMutableArray arrayWithArray:remainArray];
        
        [self combineFromPersonArray:personArr
                          prizeCount:remainPrizeCount
                         resultArray:resultArr
                    totalResultArray:totalResultArray];
    }
}

@end
