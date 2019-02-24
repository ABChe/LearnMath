//
//  BaseViewController.m
//  LearnMath
//
//  Created by 车 on 2019/1/27.
//  Copyright © 2019 车. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UILabel *questionLabel;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.questionLabel];
}


#pragma mark -

- (UILabel *)questionLabel {
    if (_questionLabel == nil) {
        _questionLabel = [[UILabel alloc] init];
        _questionLabel.textColor = [UIColor darkTextColor];
        _questionLabel.numberOfLines = 0;
        _questionLabel.font = [UIFont systemFontOfSize:20.f];
        _questionLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _questionLabel;
}


#pragma mark -

- (void)setQuestionDescription:(NSString *)questionDescription {
    _questionDescription = questionDescription;
    
    CGSize size = [_questionDescription sizeWithAttributes:@{NSFontAttributeName : _questionLabel.font}];
    _questionLabel.text = _questionDescription;
    _questionLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), ceil(size.height));
}

@end
