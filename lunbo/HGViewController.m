//
//  HGViewController.m
//  lunbo
//
//  Created by zhh on 15/12/17.
//  Copyright © 2015年 zhh. All rights reserved.
//

#import "HGViewController.h"
#import "HGScrollPictureView.h"
@interface HGViewController ()<HGScrollPictureViewDelegate>
@property (nonatomic, strong) HGScrollPictureView *picView;
@end

@implementation HGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *images = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"]];
    self.picView = [[HGScrollPictureView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 260) images:images isAutoScroll:YES];
    self.picView.delegate = self;
    [self.picView setPageControllFrame:CGRectMake(0, 0, 100, 30)];
    [self.picView setPageIndicatorTintColor:[UIColor yellowColor]];
    [self.picView setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [self.view addSubview:self.picView];

    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.picView startScroll];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.picView pauseScroll];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
