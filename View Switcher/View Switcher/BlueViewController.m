//
//  BlueViewController.m
//  View Switcher
//
//  Created by FISC on 2017/8/19.
//  Copyright © 2017年 FISC. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

-(IBAction)blueButtonPressed {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Blue View Button Pressed"
                                message:@"You pressed the button on the blue view"
                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Yep, I did"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
