//
//  XJTestViewtrColler.m
//  ExpandLabDemo
//
//  Created by iOS1 on 2021/5/10.

#import "XJTestViewtrColler.h"
#import "ExpandLabel.h"

@interface XJTestViewtrColler () {
    ExpandLabel * expandLab;
    UILabel * bottomLab;
}

@end

@implementation XJTestViewtrColler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    
    [self initUI];
}

- (void)initUI {
    
    
    __block typeof(self) weakSelf = self;
    
    expandLab = [[ExpandLabel alloc] initWithFrame:CGRectMake(10, Height_NavBar, SCREEN_WIDTH-20, 10)];
    [expandLab setLabelText:@"国产车由于超高的性价比，加之设计越来越年轻化，\n很多年轻人追求时尚和新鲜感，以及拥有个性化的消费观，这样的心态导致越来越多的年轻人愿意去选择国产车。\n国家哲学社会科学文献中心日前上线，学术党终于迎来了春天，以后下论文终于免费了！\n据介绍，该中心收录中外文学术期刊7000多种，\n还有图书、古籍，上线数据已超千万，\n内容很丰富！赶紧转发收藏吧！" expandBlock:^(CGFloat textHeight) {
        
        NSLog(@"文本高度-----%.2f",textHeight);
        
        //点击展开 界面重新布局
        [weakSelf updateUI];
    }];
    expandLab.backgroundColor = [UIColor whiteColor];
    expandLab.layer.borderWidth = 1.0;
    expandLab.layer.borderColor = [UIColor grayColor].CGColor;
    expandLab.layer.cornerRadius = 8;
    expandLab.layer.masksToBounds = YES;
    
    [self.view addSubview:expandLab];
    
    bottomLab = [[UILabel alloc] initWithFrame:CGRectMake(20, expandLab.frame.origin.y + expandLab.frame.size.height + 20, 320, 20)];
    bottomLab.text = @"底部控件 用于展开后它也下移";
    [self.view addSubview:bottomLab];
    
    //按钮
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-160/2, SCREEN_HEIGHT-Height_TapBar, 160, 44)];
    btn.layer.borderWidth = 1.0;
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.layer.cornerRadius = 22;
    btn.layer.masksToBounds = YES;
    [btn addTarget:self action:@selector(changeText:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"改变文字" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:48/255.0 green:89/255.0 blue:234/255.0 alpha:1.0];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
}

- (void)updateUI {
    bottomLab.frame = CGRectMake(20, expandLab.frame.origin.y + expandLab.frame.size.height + 20, 320, 20);
}

- (void)changeText:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    __block typeof(self) weakSelf = self;
    
    if (sender.selected) {
        [expandLab setLabelText:@"如果您认为信息内容有什么问题，请反馈给我们，我们将及时处理您的反馈。" expandBlock:^(CGFloat textHeight) {
            
            
            NSLog(@"文本高度-----%.2f",textHeight);
            //点击展开 界面重新布局
            [weakSelf updateUI];
        }];
    } else {
        [expandLab setLabelText:@"国考竞争最强岗位 国家统计局2000多比1，经过25天复习获得第一成绩。没有报培训班，本来打算报的，看过一些资料和网课感觉，国考看似高大上，除了中央部委机关的那些岗位外，其实很多岗位不如省考的好。如果你实力强大，能够考入中央部委，那国考是为你而准备。但大多数时候，国考的岗位是税务局、海事局、海关、审计署等在基层的岗位。这些位于基层的岗位，跟当地政府部门联系不多，享受不到当地政府的福利政策。尤其是沿海发达地区。" expandBlock:^(CGFloat textHeight) {
            
            
            NSLog(@"文本高度-----%.2f",textHeight);
            //点击展开 界面重新布局
            [weakSelf updateUI];
        }];
        
    }
    
    [self updateUI];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
