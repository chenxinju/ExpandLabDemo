![Untitled](https://user-images.githubusercontent.com/18587383/120986811-8e90f180-c7af-11eb-857f-bca4572f9768.gif)
# ExpandLab
可展开的Label控件
使用：IOS11+

可展开的Label
可设置最小行数
点击整个区域展开隐藏
UI更新通过block

一个简单的小控件

expandLab = [[ExpandLabel alloc] initWithFrame:CGRectMake(10,20, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height/2)];
    [expandLab setLabelText:@"国产车由于超高的性价比，加之设计越来越年轻化，\n很多年轻人追求时尚和新鲜感，以及拥有个性化的消费观，这样的心态导致越来越多的年轻人愿意去选择国产车。\n国家哲学社会科学文献中心日前上线，学术党终于迎来了春天，以后下论文终于免费了！\n据介绍，该中心收录中外文学术期刊7000多种，\n还有图书、古籍，上线数据已超千万，\n内容很丰富！赶紧转发收藏吧\n\ndafa" expandBlock:^{
        
        //点击展开 界面重新布局
        [weakSelf updateUI];
    }];
    
    expandLab.backgroundColor = [UIColor whiteColor];
    expandLab.layer.borderWidth = 1.0;
    expandLab.layer.borderColor = [UIColor grayColor].CGColor;
    expandLab.layer.cornerRadius = 8;
    expandLab.layer.masksToBounds = YES;
