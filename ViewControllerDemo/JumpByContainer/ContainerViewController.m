//
//  ContainerViewController.m
//  ViewControllerDemo
//
//  Created by 林超阳 on 2017/10/13.
//  Copyright © 2017年 林超阳. All rights reserved.
//

#import "ContainerViewController.h"
#import "FromViewController.h"
#import "ToViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 1. setup the root view controller of container controller
    FromViewController *fromVC = [[FromViewController alloc] init];
    [self addChildViewController:fromVC];
    [self.view addSubview:fromVC.view];
    [fromVC didMoveToParentViewController:self];
}

- (void)jumpToViewController:(UIViewController *)viewController
{
    UIViewController *fromVC = self.childViewControllers.firstObject;
    UIViewController *toVC = viewController;
    
    [self addChildViewController:toVC];
    [fromVC willMoveToParentViewController:nil];
    toVC.view.alpha = 0;
    [self.view addSubview:toVC.view];
    
    [UIView animateWithDuration:0.7 animations:^{
        fromVC.view.alpha = 0;
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        [fromVC.view removeFromSuperview];
        [fromVC removeFromParentViewController];
        [toVC didMoveToParentViewController:self];
    }];
}

@end
