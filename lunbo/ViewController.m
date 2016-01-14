//
//  ViewController.m
//  lunbo
//
//  Created by zhh on 15/12/17.
//  Copyright © 2015年 zhh. All rights reserved.
//

#import "ViewController.h"
#import "HGScrollPictureView.h"
#import "HGViewController.h"
@interface ViewController ()<HGScrollPictureViewDelegate>
@property (nonatomic, strong) HGScrollPictureView *picView;
@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.picView startScroll];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.picView pauseScroll];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSArray *images = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"]];
//    self.picView = [[ScrollPictureView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 260) images:images isAutoScroll:YES];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"next" forState:UIControlStateNormal];
    btn.frame = CGRectMake(50, 300, 80, 40);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *urlStrings = @[@"http://pic14.nipic.com/20110522/7411759_164157418126_2.jpg", @"http://img.taopic.com/uploads/allimg/130501/240451-13050106450911.jpg", @"http://pic.nipic.com/2007-11-09/200711912453162_2.jpg"];
    [HGScrollPictureView scrollPictureViewWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 260) urlStrings:urlStrings isAutoScroll:YES block:^(HGScrollPictureView *scrollPictureView) {
        self.picView = scrollPictureView;
        self.picView.delegate = self;
        [self.picView setPageControllFrame:CGRectMake(0, 0, 100, 30)];
        [self.picView setPageIndicatorTintColor:[UIColor yellowColor]];
        [self.picView setCurrentPageIndicatorTintColor:[UIColor redColor]];
        [self.view addSubview:self.picView];
    }];
    
}

- (void)next
{
    [self presentViewController:[[HGViewController alloc] init] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollPictureViewDelegate

- (void)scrollPictureView:(HGScrollPictureView *)scrollPictureView didSelectedItemAtIndex:(NSInteger)index
{
    NSLog(@"selected %ld",index);
}

//如果需要更精确的index可以观察我暴漏出来的pageControll的currentPage属性
- (void)scrollPictureView:(HGScrollPictureView *)scrollPictureView didScorllingAtIndex:(NSInteger)index
{
    NSLog(@"scroll %ld",index);
}
@end
