//
//  SecondViewController.m
//  ViewControllerDemo
//
//  Created by 林超阳 on 2017/10/13.
//  Copyright © 2017年 林超阳. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"I'm fine, thanks!";
    label.textColor = [UIColor whiteColor];
    [label sizeToFit];
    label.center = self.view.center;
    [self.view addSubview:label];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 100, 50);
    backBtn.center = CGPointMake(self.view.center.x, CGRectGetMaxY(label.frame) + 30);
    [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)back:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
