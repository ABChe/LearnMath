//
//  ViewController4.m
//  LearnMath
//
//  Created by 车 on 2019/3/4.
//  Copyright © 2019 车. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];

    self.questionDescription = @"在你日常的工作的项目中，什么地方用到了数学归纳法来提升代码的运行效率？如果没有遇到过，你可以尝试做做实验，看看是否有提升？";
}

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
}


@end
