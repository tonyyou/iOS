//
//  ViewController.m
//  TableCell2
//
//  Created by Tony on 2017/8/21.
//  Copyright © 2017年 Tony. All rights reserved.
//

#import "ViewController.h"
#import "NameAndColorCell.h"

static NSString *CellTableIdentifier = @"CellTableIdentifier";

@interface ViewController ()

@property (copy, nonatomic) NSArray *computers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.computers = @[@{@"Name" : @"MacBook Air", @"Color" : @"Silver"},
                       @{@"Name" : @"MacBook Pro", @"Color" : @"Silver"},
                       @{@"Name" : @"iMac", @"Color" : @"Silver"},
                       @{@"Name" : @"Mac Mini", @"Color" : @"Silver"},
                       @{@"Name" : @"Mac Pro", @"Color" : @"Black"},
                       @{@"Name" : @"iPhone 6", @"Color" : @"Black"},
                       @{@"Name" : @"iPhone 6S", @"Color" : @"Black"},
                       @{@"Name" : @"iPhone 6 Plus", @"Color" : @"Black"},
                       @{@"Name" : @"iPhone 7", @"Color" : @"Black"},
                       @{@"Name" : @"iPhone 7 Plus", @"Color" : @"Black"},
                       @{@"Name" : @"iPhone 7s", @"Color" : @"Black"},
                       @{@"Name" : @"Mac TV", @"Color" : @"Color"}];
    
    UITableView *tableView = (id)[self.view viewWithTag:1];
    tableView.rowHeight = 65;
    
    UINib *nib = [UINib nibWithNibName:@"NameAndColorCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellTableIdentifier];
    
    UIEdgeInsets contentInset = tableView.contentInset;
    contentInset.top = 20;
    [tableView setContentInset:contentInset];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForRowAtIndexPath: indexPath:[%d]", (int)indexPath.row);
    NameAndColorCell *cell = [tableView
                              dequeueReusableCellWithIdentifier: CellTableIdentifier
                              forIndexPath:indexPath];
    
    NSDictionary *rowData = self.computers[indexPath.row];
    cell.name = rowData[@"Name"];
    cell.color = rowData[@"Color"];
    return cell;
}

@end
