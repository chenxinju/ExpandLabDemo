//
//  ExpandLabel.h
//  InformationApp
//
//  Created by iOS1 on 2021/5/10.

#import <UIKit/UIKit.h>

#define IS_IPhoneX_All ({\
int tmp = 0;\
if (@available(iOS 11.0, *)) {\
if ([UIApplication sharedApplication].delegate.window.safeAreaInsets.top > 20) {\
tmp = 1;\
}else{\
tmp = 0;\
}\
}else{\
tmp = 0;\
}\
tmp;\
})
#define MAINSTATUSHEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

//状态栏高度
#define Height_StatusBar [UIApplication sharedApplication].delegate.window.safeAreaInsets.top
//导航栏高度
#define Height_NavBar (IS_IPhoneX_All ? 88.0 : 64.0)

#define Height_TapBar (IS_IPhoneX_All ? 83.0 : 49.0)

#define NAVCENTERY MAINSTATUSHEIGHT + (Height_NavBar - MAINSTATUSHEIGHT)/2.0

#define Height_TapBarSafeBottomMargin (IS_IPhoneX_All ? 34.0 : 0)

#define SAFE_AREA_INSERTS_TOP [VTDeviceHelper safeAreaInsetsTop]
#define TOP_BAR_HEIGHT (SAFE_AREA_INSERTS_TOP + 44)

//获取屏幕宽高
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define kScreen_Bounds [UIScreen mainScreen].bounds


typedef void(^ExpandLabBlock)(CGFloat textHeight);
/**
 *  可展开的Label
 */
@interface ExpandLabel : UIView

/**
 *  设置内容 以及相应位置的控件frame改变的block
 *
 *  @param text        内容
 *  @param expandBlock 此处改变 对应控件 frame
 */
- (void)setLabelText:(NSString *)text expandBlock:(ExpandLabBlock)expandBlock;

@end
