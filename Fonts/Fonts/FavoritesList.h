//
//  FavoritesList.h
//  Fonts
//
//  Created by FISC on 2017/8/22.
//  Copyright © 2017年 FISC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesList : NSObject
+(instancetype) sharedFavoritesList;
-(NSArray *) favorites;
-(void) addFavorite:(id)item;
-(void) removeFavorite:(id)item;
@end
