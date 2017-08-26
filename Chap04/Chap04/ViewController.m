//
//  ViewController.m
//  Chap04
//
//  Created by FISC on 2017/8/16.
//  Copyright © 2017年 FISC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;

@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingButton;

@end

@implementation ViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Are you sure?"
                                                                        message:nil
                                                                 preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes, I am sure!"
                                                         style:UIAlertActionStyleDestructive
                                                       handler:^(UIAlertAction * action) {
                                                           NSString *msg;
                                                           if([self.nameField.text length] > 0)
                                                           {
                                                               msg = [NSString
                                                                      stringWithFormat:@"You can breathe easy, %@, everything went OK.",
                                                                      self.nameField.text];
                                                           }
                                                           else
                                                           {
                                                               msg = @"You can breathe easy, everything went OK.";
                                                           }
                                                           UIAlertController *controller2 = [UIAlertController
                                                                                             alertControllerWithTitle:@"Something was done" message:msg
                                                                                             preferredStyle:UIAlertControllerStyleAlert];
                                                           UIAlertAction *cancelAction = [UIAlertAction
                                                                                          actionWithTitle:@"Phew"
                                                                                          style:UIAlertActionStyleCancel
                                                                                          handler:nil];
                                                           [controller2 addAction:cancelAction];
                                                           [self presentViewController:controller2
                                                                              animated:YES
                                                                            completion:nil];
                                                       }];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No way"
                                                       style:UIAlertActionStyleCancel
                                                     handler:nil];
    
    [controller addAction:yesAction];
    [controller addAction:noAction];
    
    UIPopoverPresentationController *ppc = controller.popoverPresentationController;
    if(ppc != nil)
    {
        ppc.sourceView = sender;
        ppc.sourceRect = sender.bounds;
        ppc.permittedArrowDirections = UIPopoverArrowDirectionDown;
    }
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)toggleControls:(UISegmentedControl *)sender {
    NSLog(@"--> toggleControls: sender.selectedSegmentIndex=[%d]",
          (int)sender.selectedSegmentIndex);
    if (sender.selectedSegmentIndex == 0) {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomethingButton.hidden = YES;
    } else {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingButton.hidden = NO;
    }
}

- (IBAction)switchChanged:(UISwitch *)sender {
    NSLog(@"--> switchChanged: %d, sender.isOn=[%@]", (int)sender.tag, sender.isOn ? @"YES":@"NO");
    BOOL setting = sender.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    NSLog(@"--> sliderChanged");
    int progress = (int)lround(sender.value);
    self.sliderLabel.text = [NSString stringWithFormat:@"%d",progress];
}

- (IBAction)backgroundTap:(id)sender {
    NSLog(@"--> backgroundTap");
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"--> textFieldDidEndEditing:%d", (int)textField.tag);
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"--> textFieldShouldReturn:%d", (int)textField.tag);
    [textField resignFirstResponder];
    return NO;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"--> textFieldShouldBeginEditing:%d", (int)textField.tag);
    return YES;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.sliderLabel.text = @"50";
}
@end
