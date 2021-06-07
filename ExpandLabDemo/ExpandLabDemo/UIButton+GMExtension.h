//
//  UIButton+GMExtension.h
//  NetdaqoProject
//
//  Created by iOS1 on 2020/12/23.
//  Copyright © 2020 CXJ-2021. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, GMButtonEdgeInsetsStyle) {
    GMButtonEdgeInsetsStyleTop, // image在上，label在下
    GMButtonEdgeInsetsStyleLeft, // image在左，label在右
    GMButtonEdgeInsetsStyleBottom, // image在下，label在上
    GMButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (GMExtension)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(GMButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

/**
 *  根据添加的title 改变 button 的长度
 *
 */

- (void)setMutableTitleWithString:(NSString *)text textFont:(UIFont *)textFont forState:(UIControlState)UIControlState;

/**
 *  字符串获取属性
 *  @param text 文字
 *  @param font 字体
 *
 *  @return size
 */
- (CGSize)sizeForNoticeTitle:(NSString*)text font:(UIFont*)font;

-(void)setTitleFontSize:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
