//
//  NSString+CCAdd.m
//  LearnMath
//
//  Created by 车 on 2019/3/31.
//  Copyright © 2019 车. All rights reserved.
//

#import "NSString+CCAdd.h"

@implementation NSString (CCAdd)

- (CGSize)calculateSizeWithFont:(UIFont *)font size:(CGSize)size  mode:(NSLineBreakMode)lineBreakMode {
    if (!font) return CGSizeMake(0, 0);
    
    NSMutableDictionary *attDic = [NSMutableDictionary new];
    attDic[NSFontAttributeName] = font;
    if (lineBreakMode != NSLineBreakByCharWrapping) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineBreakMode = lineBreakMode;
        attDic[NSParagraphStyleAttributeName] = paragraphStyle;
    }
    CGRect rect = [self boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attDic
                                     context:nil];
    return rect.size;
}

- (NSString *)reverse {
    NSMutableString *reverseString = [[NSMutableString alloc] initWithCapacity:self.length];
    
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
                              [reverseString appendString:substring];
                          }];
    
    NSString *string = [NSString stringWithString:reverseString];
    return string;
}

@end
