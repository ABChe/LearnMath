//
//  ViewController6.h
//  LearnMath
//
//  递归
//  Created by 车 on 2019/3/12.
//  Copyright © 2019 车. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController6 : BaseViewController

/*
 1.我们把归并和分治的思想结合起来，这其实就是归并排序算法。这种算法每次把数列进行二等分，直到唯一的数字，也就是最基本的有序数列。然后从这些最基本的有序数列开始，两两合并有序的数列，直到所有的数字都参与了归并排序。用一句话说就是，归并排序使用了分治的思想，而这个过程需要使用递归来实现。
 
 2.在单台机器上实现归并排序的时候，我们只需要在递归函数内，实现数据分组以及合并就行了。而在多个机器之间分配数据的时候，递归函数内除了分组及合并，还要把数据分发到某台机器上。如果分治的时候只进行一次问题切分，那层级型分布式架构就可以转化为类似MapReduce的架构，其中有三个步骤用到了分治，分别是数据分割和映射、归约、合并。
 */
@end

NS_ASSUME_NONNULL_END
