//
//  NSString+category.h
//  ExpandLabDemo
//
//  Created by iOS1 on 2021/5/10.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString (category)

//计算文字宽度
- (CGFloat)widthWithFont:(UIFont *)font fixedWithHeight:(CGFloat)height;

//计算文字高度
- (CGFloat)heightWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing fixedWithWidth:(CGFloat)width;

//计算文字宽高
- (CGSize )boundingRectWithSizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing fixedWithWidth:(CGFloat)width;


@end

NS_ASSUME_NONNULL_END
