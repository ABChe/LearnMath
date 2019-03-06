//
//  ViewController5.h
//  LearnMath
//
//  递归
//  Created by 车 on 2019/3/5.
//  Copyright © 2019 车. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController5 : BaseViewController

/*
 在递归中，每次嵌套调用都会让函数体生成自己的局部变量，正好可以用来保存不同状态下的数值，为我们省去了大量中间变量的操作，极大地方便了设计和编程。
 
 递归就是将复杂的问题，每次都解决一点点，并将剩下的任务转换成为更简单的问题等待下次求解，如此反复，知道最简单的形式。
 
 递归和循环其实都是迭代法的实现，而且在某些场合下，它们的实现是可以相互转换的。
 
 递归的核心思想和数学归纳法类似，并更具有广泛性。两者的类似之处体现在：将当前的问题化解为两部分：一个当前所采取的步骤和另一个更简单的问题。
 */

@end

NS_ASSUME_NONNULL_END
