//
//  InteracteAnimation.m
//  ViewControllerDemo
//
//  Created by 林超阳 on 2017/10/13.
//  Copyright © 2017年 林超阳. All rights reserved.
//

#import "InteracteAnimation.h"

@interface InteracteAnimation ()

@property (nonatomic, weak) UIViewController *vc;

@end

@implementation InteracteAnimation

- (instancetype)initWithViewController:(UIViewController *)viewController
{
    if (self = [super init]) {
        self.vc = viewController;
    }
    return self;
}

- (void)setVc:(UIViewController *)vc
{
    _vc = vc;
    UIScreenEdgePanGestureRecognizer *gestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    gestureRecognizer.edges = UIRectEdgeLeft;
    [vc.view addGestureRecognizer:gestureRecognizer];
}

- (void)swipe:(UIScreenEdgePanGestureRecognizer *)sender
{
    if (![self.vc isBeingDismissed]) {
        [self.vc dismissViewControllerAnimated:YES completion:nil];
    }
    CGPoint point = [sender translationInView:self.vc.view];
    CGFloat total = CGRectGetWidth([UIScreen mainScreen].bounds) / 2;
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            if ((point.x / total) >= 1) {
                [self finishInteractiveTransition];
            } else {
                [self cancelInteractiveTransition];
            }
            break;
        case UIGestureRecognizerStateChanged:
            [self updateInteractiveTransition:(point.x) / total];
            break;
        default:
            break;
    }
}

- (void)cancelInteractiveTransition
{
    [super cancelInteractiveTransition];
    
}

@end
