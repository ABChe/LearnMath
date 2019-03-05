//
//  ViewController4.h
//  LearnMath
//
//  数学归纳法
//  Created by 车 on 2019/3/4.
//  Copyright © 2019 车. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController4 : BaseViewController

/*
 数学归纳法是一种数学证明方法，通常被用于证明某个给定命题在整个（或者局部）自然数范围内成立。
 
 数学归纳法解题步骤：
 1. 证明 n = 1 时公式成立。
 2. 假设 n = k - 1 成立，证明 n = k 时也成立。

 
 1. 数学归纳法和归纳有什么不一样？
 平时我们谈的`归纳`是一种从经验事实中找出普遍特征的认知方法。数学归纳法则是一种数学证明方法，有具体的步骤。
 
 2. 数学归纳法和迭代法有什么不一样？
 和迭代法的计算相比，数学归纳法最大的特点在于`归纳`二字。他已经总结出了规律，只要我们能够证明这个规律是正确的，可以节省很多时间和资源。

 3. 递归调用和数学归纳法的逻辑是一样的！
 只要数学归纳证明的逻辑是对的，递归调用的逻辑就是对的，没有纠结递归函数是如何嵌套调用和返回的。
 */

@end

NS_ASSUME_NONNULL_END
