//
//  ViewController.m
//  Chap01
//
//  Created by Tony on 2017/8/15.
//  Copyright © 2017年 Tony. All rights reserved.
//

#import "ViewController.h"
#import "RSAEncrypt.h"

@interface ViewController () 
@property (weak, nonatomic) IBOutlet UIButton *btnEncrypt;
@property (weak, nonatomic) IBOutlet UILabel *lblEncrypt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.lblEncrypt.layer.cornerRadius = 8;
    self.lblEncrypt.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.lblEncrypt.layer.borderWidth = 1.0;

    /*
    UIView * mainview = self.view;
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    v.backgroundColor = [UIColor redColor];
    [mainview addSubview:v];
     */
}

- (IBAction)btnEncrypt_Click:(id)sender {
    NSLog(@"btnEncrypt_Click");
    RSAEncrypt *rsa = [[RSAEncrypt alloc] init];
    if (rsa != nil) {
        NSString *string = [rsa encryptToString:@"Hello Objective-C"];
        self.lblEncrypt.text = string;
        [self.lblEncrypt sizeToFit];
    } else {
        NSLog(@"Error");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
