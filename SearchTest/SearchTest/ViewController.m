//
//  ViewController.m
//  SearchTest
//
//  Created by FISC on 2017/8/25.
//  Copyright © 2017年 FISC. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSLog(@"documentDirectory=[%@]", documentDirectory);
    
    NSString *filename = [documentDirectory stringByAppendingPathComponent:@"theFile.txt" ];
    NSLog(@"filename=[%@]", filename);
    
    FILE *fp = fopen([filename fileSystemRepresentation], "w+");
    if (fp != NULL) {
        fputs([@"test done" UTF8String], fp);
        NSLog(@"*** write to Document OK ***");
        fclose(fp);
    }
    
    NSArray *paths2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
                                                         NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths2 objectAtIndex:0];
    NSLog(@"libraryDirectory=[%@]", libraryDirectory);
    
    NSString *tempPath = NSTemporaryDirectory();
    NSLog(@"tempPath=[%@]", tempPath);
    
    NSString *tempFile = [tempPath stringByAppendingPathComponent:@"tempFile.txt"];
    NSLog(@"tempFile=[%@]", tempFile);
    FILE *fp2 = fopen([tempFile fileSystemRepresentation], "w+");
    if (fp2 != NULL) {
        fputs([@"test done temp" UTF8String], fp);
        NSLog(@"*** write to temp OK ***");
        fclose(fp);
    }
    
    NSString *tempPlist = [tempPath stringByAppendingPathComponent:@"temp.plist"];
    NSArray *myArray = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    [myArray writeToFile:tempPlist atomically:YES];
    NSLog(@"*** write to plist OK ***");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
