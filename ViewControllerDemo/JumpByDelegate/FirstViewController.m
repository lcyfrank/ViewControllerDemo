//
//  FirstViewController.m
//  ViewControllerDemo
//
//  Created by 林超阳 on 2017/10/13.
//  Copyright © 2017年 林超阳. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "JumpAnimation.h"
#import "InteracteAnimation.h"

@interface FirstViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) InteracteAnimation *animation;

@end

@implementation FirstViewController

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

- (void)jumpTo:(UIButton *)sender
{
    SecondViewController *toVC = [[SecondViewController alloc] init];
    toVC.transitioningDelegate = self;
    [self presentViewController:toVC animated:YES completion:nil];
    
    self.animation = [[InteracteAnimation alloc] initWithViewController:toVC];
}

# pragma mark - transition animation
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[JumpAnimation alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[JumpAnimation alloc] init];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.animation;
}


@end
