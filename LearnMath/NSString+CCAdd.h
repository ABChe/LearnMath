//
//  NSString+CCAdd.h
//  LearnMath
//
//  Created by 车 on 2019/3/31.
//  Copyright © 2019 车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CCAdd)

- (CGSize)calculateSizeWithFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

- (NSString *)reverse;

@end

NS_ASSUME_NONNULL_END
