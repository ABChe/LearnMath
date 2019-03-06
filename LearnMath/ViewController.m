//
//  ViewController.m
//  LearnMath
//
//  Created by 车 on 2019/1/27.
//  Copyright © 2019 车. All rights reserved.
//

#import "ViewController.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface ViewController ()

@property (nonatomic, copy) NSArray *titleArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
}


#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.numberOfLines = 0;
    NSString *string = [NSString stringWithFormat:@"%ld. %@", indexPath.row, self.titleArray[indexPath.row]];
    cell.textLabel.text = string;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger sortNumber = indexPath.row + 1;
    NSString *className = [NSString stringWithFormat:@"ViewController%ld", sortNumber];
    Class class = NSClassFromString(className);
    
    if (class) {
        UIViewController *vc = [class new];
        vc.title = self.titleArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark -

- (NSArray *)titleArray {
    if (_titleArray == nil) {
        _titleArray = @[@"二进制：不了解计算机的源头，你学什么编程",
                        @"余数：原来取余操作本身就是个哈希函数",
                        @"迭代法：不用变成语言的自带函数，你会如何计算平方根",
                        @"数学归纳法：如何用数学归纳提升代码的运行效率？",
                        @"递归（上）：泛化数学归纳，如何将复杂的问题简单化"];
    }
    return _titleArray;
}

@end
