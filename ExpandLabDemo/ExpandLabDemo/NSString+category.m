//
//  NSString+category.m
//  ExpandLabDemo
//
//  Created by iOS1 on 2021/5/10.

#import "NSString+category.h"

@implementation NSString (category)


- (CGFloat)widthWithFont:(UIFont *)font fixedWithHeight:(CGFloat)height {
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    
    return ceil(rect.size.width);
}

- (CGFloat)heightWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing fixedWithWidth:(CGFloat)width {
    //清除收尾换行与空格
    NSString *title = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //    NSLog(@"计算的文本信息--------%@",title);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    [paragraphStyle setLineSpacing:lineSpacing];
    
    NSDictionary * attributes = @{
        NSFontAttributeName:font,
        NSParagraphStyleAttributeName: paragraphStyle
    };
    CGSize textRect = CGSizeMake(width, MAXFLOAT);
    CGFloat textHeight = [title boundingRectWithSize:textRect
                                             options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                          attributes:attributes
                                             context:nil].size.height;
    return textHeight;
    
}

//计算文字宽高
- (CGSize )boundingRectWithSizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing fixedWithWidth:(CGFloat)width {
    
    //清除收尾换行与空格
    NSString *title = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //    NSLog(@"计算的文本信息--------%@",title);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    [paragraphStyle setLineSpacing:lineSpacing];
    
    NSDictionary * attributes = @{
        NSFontAttributeName:font,
        NSParagraphStyleAttributeName: paragraphStyle
    };
    CGSize textRect = CGSizeMake(width, MAXFLOAT);
    CGSize textSize = [title boundingRectWithSize:textRect
                                          options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                       attributes:attributes
                                          context:nil].size;
    return textSize;
}


@end
