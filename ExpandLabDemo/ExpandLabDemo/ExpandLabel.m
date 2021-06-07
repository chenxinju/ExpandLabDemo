//
//  ExpandLabel.m
//  InformationApp
//
//  Created by iOS1 on 2021/5/10.

#import "ExpandLabel.h"
#import "NSString+category.h"
#import "UIButton+GMExtension.h"

static int canClickContainerToExpand = 0; ///<点击 控件区域 控制展开 0 NO,1 YES
static int MIN_LINES_CAN_EXPAND  = 3;
static int FONT_SIZE = 16;

static CGFloat SpaceX = 20.0f;
static CGFloat SpaceY = 10.0f;

@interface ExpandLabel()

@property (nonatomic, strong) UILabel * desLab; ///<文字
@property (nonatomic, strong) UIButton * expandBtn; ///<按钮
@property (nonatomic, assign) BOOL hasExpandBtn; ///<是否显示 展开按钮

@property (nonatomic, strong) UIButton * containerBtn; ///<容器 按钮 控制点击

@property (nonatomic, copy) ExpandLabBlock expandLabBlock;

@end


@implementation ExpandLabel


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setLabelText:(NSString *)text expandBlock:(ExpandLabBlock)expandBlock {
    
    _expandLabBlock = expandBlock;
    
    [self removeViewInSuperView];
    
    self.desLab = [[UILabel alloc] initWithFrame:CGRectMake(SpaceX, SpaceY, self.frame.size.width - 2*SpaceX, 0)];
    _desLab.font = [UIFont systemFontOfSize:FONT_SIZE];
    _desLab.textColor = [UIColor colorWithRed:139/255.0 green:139/255.0 blue:139/255.0 alpha:1.0];
    
    _desLab.backgroundColor = [UIColor clearColor];
    _desLab.numberOfLines = MIN_LINES_CAN_EXPAND;
    
    [self addSubview:_desLab];
    
    CGSize desLabSize = [text boundingRectWithSizeWithFont:_desLab.font lineSpacing:6 fixedWithWidth:_desLab.frame.size.width];
    //[text boundingRectWithSize:CGSizeMake(_desLab.frame.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName:_desLab.font} context:nil].size;
    
    NSString *contentStr = @"";
    if (text.length) {
        contentStr = text;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:contentStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:6];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, contentStr.length)];
    //设置完以后UITextView的font属性就失效了，要重新设置
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, contentStr.length)];
    _desLab.attributedText = attributedString;
    // 设置了 attributedText 后省略号不显示  问题解决办法： 在设置 attributedText 后，在对 lineBreakMode 进行一下设置
    _desLab.lineBreakMode = NSLineBreakByTruncatingTail;
    
    //_desLab.text = text;//[NSString stringWithFormat:@"\t%@",text];
    [_desLab sizeToFit];
    
    //模拟 内容
    NSString * simulateStr = [NSString string];
    for (int i= 0; i < MIN_LINES_CAN_EXPAND; i ++) {
        simulateStr = [simulateStr stringByAppendingString:@"\n"];
    }
    
    //最小可展开的高度
    CGSize limitHForExpandSize = [simulateStr boundingRectWithSize:CGSizeMake(_desLab.frame.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:_desLab.font} context:nil].size;
    
    if (ceilf(desLabSize.height) > limitHForExpandSize.height) {
        NSLog(@"--可展开");
        self.expandBtn = [[UIButton alloc] initWithFrame:CGRectMake(6, _desLab.frame.size.height + _desLab.frame.origin.y + SpaceY, 80, 30)]; //x =  self.frame.size.width - 80 - SpaceX
        _expandBtn.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_expandBtn setTitle:@"全文" forState:UIControlStateNormal];
        [_expandBtn setImage:[UIImage imageNamed:@"message_down"] forState:UIControlStateNormal];
        
        [_expandBtn setTitle:@"收起" forState:UIControlStateSelected];
        [_expandBtn setImage:[UIImage imageNamed:@"message_up"] forState:UIControlStateSelected];
        
        [_expandBtn setTitleColor:[UIColor colorWithRed:48/255.0 green:89/255.0 blue:234/255.0 alpha:1.0] forState:UIControlStateNormal];
        [_expandBtn setTitleFontSize:12];
        [_expandBtn addTarget:self action:@selector(expandBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_expandBtn layoutButtonWithEdgeInsetsStyle:(GMButtonEdgeInsetsStyleRight) imageTitleSpace:6];
        [self addSubview:_expandBtn];
        
        _hasExpandBtn = YES;
        
        CGRect selfFrame = self.frame;
        selfFrame.size.height = _expandBtn.frame.origin.y + SpaceY + _expandBtn.frame.size.height;
        self.frame = selfFrame;
        
        //点击控件区域 控制展开 收起
        if (canClickContainerToExpand) {
            _containerBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [_containerBtn addTarget:self action:@selector(expandBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            //            _co1203ntainerBtn.backgroundColor = [UIColor colorWithRed:1.000 green:1.000 blue:0.000 alpha:0.350];
            [self addSubview:_containerBtn];
        }
        
    } else {
        
        _hasExpandBtn = NO;
        
        CGRect selfFrame = self.frame;
        selfFrame.size.height = _desLab.frame.size.height + 2*SpaceY;
        self.frame = selfFrame;
        
        
    }
    
    
}

- (void)removeViewInSuperView {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _hasExpandBtn = NO;
}

- (void)layoutSubviews {
    NSLog(@"layoutSubviews");
    
    CGRect selfFrame = self.frame;
    
    
    if (_hasExpandBtn) {
        selfFrame.size.height = _expandBtn.frame.origin.y + SpaceY + _expandBtn.frame.size.height;
    } else {
        selfFrame.size.height = _desLab.frame.origin.y + SpaceY + _desLab.frame.size.height;
    }
    
    self.frame = selfFrame;
    _containerBtn.frame = self.bounds;
    if (_expandLabBlock) {
        _expandLabBlock(selfFrame.size.height);
    }
    
}

#pragma mark- 展开按钮点击 展开 收起
- (void)expandBtnClick:(UIButton *)sender {
    
    if (!_expandBtn) {
        return;
    }
    _expandBtn.selected = !_expandBtn.selected;
    
    if (_expandBtn.selected) {
        _desLab.numberOfLines = 0;
        
    } else {
        _desLab.numberOfLines = MIN_LINES_CAN_EXPAND;
    }
    [_desLab sizeToFit];
    _expandBtn.frame = CGRectMake(6, _desLab.frame.size.height + _desLab.frame.origin.y + SpaceY, 80, 30);
    //CGRectMake(self.frame.size.width - 80 - SpaceX, _desLab.frame.size.height + _desLab.frame.origin.y + SpaceY, 80, 30);
    
    
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
