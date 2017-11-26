//
//  NSString+WGExtension.m
//
//  Created by Veeco on 4/4/17.
//  Copyright © 2017 Veeco. All rights reserved.
//

#import "NSString+WGExtension.h"

@implementation NSString (WGExtension)

/**
 * 计算出文字总体高度
 * 参数 width 文字总体宽度
 * 参数 font 文字字体
 * 返回 文字总体高度
 * 注意 传入的宽度与字体大小要大于0且宽度不小于字体大小
 */
- (CGFloat)wg_calculateStringHeightWithWidth:(CGFloat)width font:(nonnull UIFont *)font {

    if (width <= 0.0 || font.pointSize <= 0.0 || width < font.pointSize) [NSException raise:@"计算文字高度出错" format:@"请检查传入的宽度与字体大小是否大于0且宽度不小于字体大小"];
    
    // 设置属性
    NSDictionary *dic = @{NSFontAttributeName : font};
    
    // 返回高度
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size.height;
}

@end
