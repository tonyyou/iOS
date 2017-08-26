//
//  ViewController.m
//  Chap01
//
//  Created by FISC on 2017/8/16.
//  Copyright © 2017年 FISC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed.", title];
    NSLog(@"%@ button pressed.", title);
    
    self.statusLabel.text = title;
    
    NSMutableAttributedString *styledText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSDictionary *attributes = @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:self.statusLabel.font.pointSize] };
    NSRange nameRange = [plainText rangeOfString:title];
    [styledText setAttributes:attributes range:nameRange];
    self.statusLabel.attributedText = styledText;
}



@end
