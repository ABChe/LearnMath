//
//  ViewController7.m
//  LearnMath
//
//  Created by 车 on 2019/3/14.
//  Copyright © 2019 车. All rights reserved.
//

#import "ViewController7.h"

@interface ViewController7 ()

@property (nonatomic, strong) NSDictionary *tHouseTimeDic; // 田忌马匹耗时
@property (nonatomic, strong) NSDictionary *qHouseTimeDic; // 齐王马匹耗时

@property (nonatomic, strong) NSMutableArray *tPermutationArray; // 田忌马匹的全部排列方案
@property (nonatomic, strong) NSMutableArray *qPermutationArray; // 齐王马匹的全部排列方案

@property (nonatomic, copy) NSString *password;

@end

@implementation ViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.questionDescription = @"假设有一个4位字母密码，每位密码是a~e之间的小写字母。你能否编写一段密码，来暴力破解密码？（提示：根据可重复排列的规律，生成所有可能的四位密码）";
    
//    [self example1];
//    [self example2];
    
    [self question];
}


#pragma mark -

/**
 田忌赛马问题
 */
- (void)example1 {
    /*
     田忌马匹：t1、t2、t3  齐王马匹：q1、q2、q3
     马匹跑完耗时： q1 < t1 < q2 < t2 < q3 < t3
     问：齐王马匹出战方案为:q1、q2、q3时 田忌赢齐王的方案
     */
    self.tPermutationArray = [NSMutableArray array];
    self.qPermutationArray = [NSMutableArray arrayWithArray:@[@[@"q1", @"q2", @"q3"]]];
    NSArray *tHourses = @[@"t1", @"t2", @"t3"];
    
    [self permutateHorses:tHourses
                   result:[NSArray array]
               totalResul:self.tPermutationArray];
    
    [self compareTPermutationArray:self.tPermutationArray
                 qPermutationArray:self.qPermutationArray];
}

/**
 获取马匹全排列

 @param horses 待出战马匹
 @param result 当前出战马匹方案
 @param totalResult 全部出战方案
 */
- (void)permutateHorses:(NSArray *)horses result:(NSArray *)result  totalResul:(NSMutableArray *)totalResult {
    if (horses.count == 0) {
        [totalResult addObject:result];
        return;
    }
    for (int i = 0; i < horses.count; i++) {
        NSMutableArray *newResult = [NSMutableArray arrayWithArray:result];
        [newResult addObject:horses[i]];
        
        NSMutableArray *restHorses = [NSMutableArray arrayWithArray:horses];
        [restHorses removeObject:horses[i]];
        
        [self permutateHorses:restHorses result:newResult totalResul:totalResult];
    }
}

/**
 比较田忌马匹的全部排列方案 和 齐王马匹的全部排列方案

 @param tArray 田忌马匹的全部排列方案
 @param qArray 齐王马匹的全部排列方案
 */
- (void)compareTPermutationArray:(NSArray *)tArray qPermutationArray:(NSArray *)qArray {
    for (int i = 0; i < tArray.count; i++) {
        NSArray *tHourses = tArray[i];
        for (int j = 0; j < qArray.count; j++) {
            NSArray *qHorses = qArray[j];
            [self compareTHourses:tHourses qHourses:qHorses];
        }
    }
}

/**
 比较具体马匹排列方案

 @param tHourses 田忌马匹的方案
 @param qHourses 齐王马匹的方案
 */
- (void)compareTHourses:(NSArray *)tHourses qHourses:(NSArray *)qHourses {
    NSInteger tScore = 0;
    for (int i = 0; i < tHourses.count; i++) {
        NSString *tHourse = tHourses[i];
        NSString *qHourse = qHourses[i];
        CGFloat tTime = [self.tHouseTimeDic[tHourse] floatValue];
        CGFloat qTime = [self.qHouseTimeDic[qHourse] floatValue];
        if (tTime < qTime) {
            tScore++;
        }
    }
    
    if (tScore >= 2) {
        // 三局两胜
        NSLog(@"\n田忌获胜的方案为 \n%@ \n此时齐王方案为%@", tHourses, qHourses);
    }
}


#pragma mark -

/*
 田忌赛马变种问题
 */
- (void)example2 {
    /*
     齐王随机安排马匹出战方案 田忌胜齐王的情况
     */
    self.tPermutationArray = [NSMutableArray array];
    self.qPermutationArray = [NSMutableArray array];
    NSArray *tHourses = @[@"t1", @"t2", @"t3"];
    NSArray *qHourses = @[@"q1", @"q2", @"q3"];

    [self permutateHorses:tHourses
                   result:[NSArray array]
               totalResul:self.tPermutationArray];
    
    [self permutateHorses:qHourses
                   result:[NSArray array]
               totalResul:self.qPermutationArray];
    
    [self compareTPermutationArray:self.tPermutationArray
                 qPermutationArray:self.qPermutationArray];
}


#pragma mark -

- (void)question {
    self.password = @"ceda";
    NSArray *characters = @[@"a", @"b", @"c", @"d", @"e"];
    
    [self crackPasswordWithCharacters:characters currentGuessPassword:[NSString string]];
}

/**
 穷举法破解密码

 @param characters 密码所有可能的字符
 @param currentGuessPassword 当前猜测的密码
 @return 是否破解成功
 */
- (BOOL)crackPasswordWithCharacters:(NSArray *)characters currentGuessPassword:(NSString *)currentGuessPassword {
    if (currentGuessPassword.length == 4) {
        BOOL succeed = [self verifyPassword:currentGuessPassword];
        NSLog(@"\n %@", currentGuessPassword);
        return succeed;
    }
    
    for (NSString *character in characters) {
        NSMutableString *string = [NSMutableString stringWithString:currentGuessPassword];
        [string appendString:character];
        
        BOOL succeed =  [self crackPasswordWithCharacters:characters currentGuessPassword:string];
        
        if (succeed) {
            NSLog(@"\n密码破解成功，密码为：%@", string);
            return succeed;
        } else continue;
    }
    
    return NO;
}

- (BOOL)verifyPassword:(NSString *)password {
    return [self.password isEqualToString:password];
}


#pragma mark -

- (NSDictionary *)tHouseTimeDic  {
    if (_tHouseTimeDic == nil) {
        _tHouseTimeDic = @{@"t1" : @1.5,
                           @"t2" : @2.5,
                           @"t3" : @3.5};
    }
    return _tHouseTimeDic;
}

- (NSDictionary *)qHouseTimeDic {
    if (_qHouseTimeDic == nil) {
        _qHouseTimeDic = @{@"q1" : @1,
                           @"q2" : @2,
                           @"q3" : @3};
    }
    return _qHouseTimeDic;
}

@end
