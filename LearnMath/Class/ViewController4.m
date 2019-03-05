//
//  ViewController4.m
//  LearnMath
//
//  Created by 车 on 2019/3/4.
//  Copyright © 2019 车. All rights reserved.
//

#import "ViewController4.h"

@interface ResultModel : NSObject

@property (nonatomic, assign) CGFloat currentGirdWheatNumber;
@property (nonatomic, assign) CGFloat totalGirdWheatNumber;
@end

@implementation ResultModel
@end


@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];

    self.questionDescription = @"在你日常的工作的项目中，什么地方用到了数学归纳法来提升代码的运行效率？如果没有遇到过，你可以尝试做做实验，看看是否有提升？";
    
    [self example1];
}

/*
 数学归纳法解'麦子'问题
 */
- (void)example1 {
    /*
     迭代法中麦子的例子我们发现两个规律：
     1. 第 n 个棋格所放的麦粒数是 2^(n - 1)
     2. 前 n 个棋格放的麦粒数为 2^n - 1
     
     证明第一个命题：
     1. 第一格（k = 1）的麦粒数 2^(1 - 1) = 2^0 = 1 命题成立
     2. 假设第 k - 1 格的麦粒数为 2^((k - 1) - 1) = 2^(k - 2) 成立。那么第 k 格的麦粒数是第 k - 1 格的两倍，即 2^(k - 2) * 2 = 2^(k - 1)。因此，如果命题在 n = k - 1的时候成立，那么在 n = k 的时候也成立。
     
     证明第二个命题
     1. 第一格（k = 1）的麦粒数 2^(1 - 1) = 2^0 = 1 命题成立。
     2. 假设前 k - 1 格的麦粒数为 2^(k - 1) - 1 成立，我们证明的第一个命题时已经证明了第 k 格麦粒数为 2^(k - 1)。那么前 k 格的麦粒数为 2^(k - 1) - 1  + 2^(k - 1) = 2^k - 1，命题成立。

     */
    
    ResultModel *model = [[ResultModel alloc] init];
    NSInteger girdNumber = 5;
    BOOL result = [self provePropositionWithGirdNumber:girdNumber resultModel:model];
    NSString *string = result ? @"成立" : @"不成立";
    NSLog(@"\n命题%@ \n格子数:%ld \n第%ld格麦粒数:%.f \n总麦粒数:%.f", string, girdNumber, girdNumber, model.currentGirdWheatNumber, model.totalGirdWheatNumber);
}


/**
 证明'麦子问题'使用数学归纳法得出的结论

 @param girdNumber 格子数
 @param resultModel 结果model
 @return 命题是否成立
 */
- (BOOL)provePropositionWithGirdNumber:(NSInteger)girdNumber resultModel:(ResultModel *)resultModel{
    NSInteger k = girdNumber;
    
    if (k == 1) {
        // 证明 n = 1 时命题是否成立
        if (pow(2, 1) - 1 == 1) {
            resultModel.currentGirdWheatNumber = 1;
            resultModel.totalGirdWheatNumber = 1;
            return YES;
        } else {
            return NO;
        }
    }
    else {
        // 如果 n = (k-1) 时命题成立证明 n = k 时命题是否成立
        // 嵌套调用数学归纳法逆向递推 数值返回迭代法正向递推
        BOOL proveOfPreviousOne = [self provePropositionWithGirdNumber:k - 1
                                                           resultModel:resultModel];
        resultModel.currentGirdWheatNumber *= 2;
        resultModel.totalGirdWheatNumber += resultModel.currentGirdWheatNumber;
        
        BOOL proveOfCurrentOne = NO;
        if (resultModel.totalGirdWheatNumber == pow(2, k) - 1) {
            proveOfCurrentOne = YES;
        }
        
        if (proveOfPreviousOne && proveOfCurrentOne) {
            return YES;
        } else {
            return NO;
        }
    }
}


@end
