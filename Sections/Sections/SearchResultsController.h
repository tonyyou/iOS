//
//  SearchResultsController.h
//  Sections
//
//  Created by FISC on 2017/8/22.
//  Copyright © 2017年 FISC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultsController : UITableViewController <UISearchResultsUpdating>

- (instancetype)initWithNames:(NSDictionary *)names keys:(NSArray *)keys;

@end
