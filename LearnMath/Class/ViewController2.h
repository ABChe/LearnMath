//
//  ViewController2.h
//  LearnMath
//
//  余数
//  Created by 车 on 2019/1/29.
//  Copyright © 2019 车. All rights reserved.
//

#import "BaseViewController.h"

@interface ViewController2 : BaseViewController

/*
 余数总是在一定范围内
 同余定理:两个整数 a 和 b，如果它们除以正整数 m 得到的余数相等，我们就可以说 a 和 b 对于模 m 同余。
 同余定理是用来分类的
 哈希也会被翻译为散列，简单来说，他是将任意长度的输入，通过哈希算法，压缩为某一固定长度的输出。
 
 例：如何快速读写100万条数据
 答：要达到高效存取，最理想的条件是开辟一个连续的空间存放这些数据，这样就可以减少寻址时间。但由于条件的限制一般没有足够容纳100万条数据的地址空间。可以考察下系统能否提供若干个较小的连续空间，每个空间又能存放一定数量的记录。比如我们找到100个较小的连续空间，这些空间彼此之间是被分隔开的，但是内部是连续的，并且足够容纳1万条记录连续存放，那么我们就可以使用余数和同余定理设计一个散列函数，并实现哈希表的结构。
    利用下列公式即可
                    等待被转换的值   有限储存空间的大小
                          \         /
                    f(x) = x mod size
                              |
                             取余
    通过余数，能将任何数值，转换为有限范围内的一个数值，然后根据这个新的数值，来确定数据存放何处。
    我们可以通过记录标号模100的余数，指定某条记录存放在哪个空间。
    公式变成：
                    f(x) = x mod 100
 
    第1和101条存放在第一个可用空间，第200和300条存放在第100个可用空间里。这样我们可以根据求余的快速数字变化，对数据进行分组，并把他们存放到不同的地址空间里。而求余操作非常简单，因此几乎不会增加寻址时间。
    除此之外，如果我们想增加数据散列的随机程度，我们还可以在公式中加入一个较大的随机数MAX。
    公式变成：
                    f(x) = (x + MAX) mod 100
                                 |
                            随机数，用于增加散列的随机程度
    这里对每一条数据存储时 MAX 都是随机的。使用了 MAX 随机数后，被分配到同一个控件的记录就更加“随机”，更适合需要将数据重新洗牌的应用场景，比如加密算法、MapReduce 中的数据分发、记录的告诉查询和定位等。
 */

@end
