//
//  FromViewController.m
//  ViewControllerDemo
//
//  Created by 林超阳 on 2017/10/13.
//  Copyright © 2017年 林超阳. All rights reserved.
//

#import "FromViewController.h"
#import "ToViewController.h"
#import "ContainerViewController.h"

@interface FromViewController ()

@end

@implementation FromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"jump to" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 100, 30);
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(jumpTo:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"view did disappear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"view will disappear");
}

- (void)jumpTo:(UIButton *)sender
{
    ToViewController *toVC = [[ToViewController alloc] init];
    [((ContainerViewController *)self.parentViewController) jumpToViewController:toVC];
}

@end
