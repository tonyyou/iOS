//
//  ViewController.m
//  View Switcher
//
//  Created by FISC on 2017/8/19.
//  Copyright © 2017年 FISC. All rights reserved.
//

#import "SwitchingViewController.h"
#import "YellowViewController.h"
#import "BlueViewController.h"

@interface SwitchingViewController ()
@property (nonatomic,strong) YellowViewController *yellowViewController;
@property (nonatomic,strong) BlueViewController *blueViewController;
@end

@implementation SwitchingViewController

-(IBAction)switchViews:(id)sender {
    NSLog(@"switchViews");
    
    // initialize
    if(!self.yellowViewController.view.superview) {
        if (!self.yellowViewController) {
            self.yellowViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Yellow"];
        }
    } else {
        if (!self.blueViewController) {
            self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"blue"];
        }
    }
    
    // switch
    [UIView beginAnimations:@"view Flip" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if (!self.yellowViewController.view.superview) {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                               forView:self.view
                                 cache:YES];
        
        self.yellowViewController.view.frame = self.view.frame;
        [self switchViewFromViewController:self.blueViewController
                          toViewController:self.yellowViewController];
    } else {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                               forView:self.view
                                 cache:YES];
        
        self.blueViewController.view.frame = self.view.frame;
        [self switchViewFromViewController:self.yellowViewController
                          toViewController:self.blueViewController];
    }
    [UIView commitAnimations];
}

- (void)switchViewFromViewController:(UIViewController *)fromVC
                    toViewController:(UIViewController *)toVC {
    if (fromVC != nil) {
        [fromVC willMoveToParentViewController:nil];
        [fromVC.view removeFromSuperview];
        [fromVC removeFromParentViewController];
    }
    if (toVC != nil) {
        [self addChildViewController:toVC];
        [self.view insertSubview:toVC.view atIndex:0];
        [toVC didMoveToParentViewController:self];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
    self.blueViewController.view.frame = self.view.frame;
    [self switchViewFromViewController:nil toViewController:self.blueViewController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if (!self.blueViewController.view.superview) {
        self.blueViewController = nil;
    } else {
        self.yellowViewController = nil;
    }
}


@end
