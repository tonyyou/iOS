//
//  FontListViewController.h
//  Fonts
//
//  Created by FISC on 2017/8/22.
//  Copyright © 2017年 FISC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontListViewController : UITableViewController
@property (copy,nonatomic) NSArray *fontNames;
@property (assign,nonatomic) BOOL showsFavorites;
@end
