//
//  ViewController.m
//  CBWKit
//
//  Created by 陈博文 on 16/4/21.
//  Copyright © 2016年 陈博文. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CBWFrame.h"
#import "CBWInfiniteBanner.h"
#import "CBWProgressView.h"
#import "UIColor+CBWColor.h"
#import "CBWCenterView.h"

@interface ViewController ()

/** 图片数组*/
@property (nonatomic ,strong) NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //frame 使用实例
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor redColor];
    view.x = 100;
    view.y = 100;
    view.width = 100;
    view.height = 100;
    [self.view addSubview:view];
    
    //图片轮播
    CBWInfiniteBanner *banner = [[CBWInfiniteBanner alloc]init];
    banner.x = 0;
    banner.y = 300;
    banner.width = [UIScreen mainScreen].bounds.size.width;
    banner.height = 150;

    banner.imageURLs = self.array;
    
  __weak typeof(self) weakself = self;
    
    banner.block = ^(NSUInteger index){
        
        NSLog(@"%@",weakself.array[index]);
        
    };
    
    [self.view addSubview:banner];
    
    
    //设置进度条
    CGRect frame = CGRectMake(0, 20, 200, 40);
    CBWProgressView *progressView = [[CBWProgressView alloc]initWithFrame:frame];
    
    progressView.backgroundColor = [UIColor greenColor];
    progressView.progressViewColor = [UIColor redColor];
    progressView.progress = 0.8;
    
    [self.view addSubview:progressView];
    
    CBWLog(NSDocumentDirectory)
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //显示提示框
    CBWCenterView *alertView = [[CBWCenterView alloc]init];
    alertView.buttonTitles = @[@"第一个",@"第二个",@"第三个"];
    alertView.buttonClickActionBlock = ^(CBWCenterView *alertView,NSUInteger index){
        NSLog(@"%zd",index);
        
        //可以更具 index 来设置所需要的操作
        
        [alertView dismiss];
    };
    [alertView show];
}
#pragma mark - setter && getter
- (NSMutableArray *)array{
    if (_array == nil) {
        _array = [NSMutableArray arrayWithArray:@[
                                                  @"http://imgnews.gmw.cn/attachement/jpg/site2/20160418/2657389265644373609.jpg",
                                                  @"http://y1.ifengimg.com/cmpp/2016/04/20/22/4f71c045-8e40-41cb-a80c-85a7ef0a93f4_size33_w550_h366.jpg",
                                                  @"http://photocdn.sohu.com/20160125/mp56380067_1453710497642_1_th.jpeg",
                                                  @"http://photocdn.sohu.com/20160125/mp56380067_1453710497642_3.jpeg",
                                                  
                                                  ]];
    }
    return _array;
}

@end
