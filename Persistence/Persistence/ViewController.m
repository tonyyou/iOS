//
//  ViewController.m
//  Persistence
//
//  Created by FISC on 2017/8/26.
//  Copyright © 2017年 FISC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) IBOutletCollection(UITextField) NSArray *lineFields;
@end

@implementation ViewController

-(NSString *) dataFilePath {
    NSLog(@"*** dataFilePath ***");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSLog(@"documentsDirectory=[%@]", documentsDirectory);
    return [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *filePath = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
        for (int i=0; i < 4; i++) {
            UITextField *theField = self.lineFields[i];
            theField.text = array[i];
        }
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(applicationWillResignActive:)
     name:UIApplicationWillResignActiveNotification
     object:app];
}

- (void)applicationWillResignActive:(NSNotification *)notification {
    NSLog(@"*** applicationWillResignActive ***");
    NSString *filePath = [self dataFilePath];
    NSArray *array = [self.lineFields valueForKey:@"text"];
    [array writeToFile:filePath atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
