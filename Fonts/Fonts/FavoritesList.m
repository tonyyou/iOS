//
//  FavoritesList.m
//  Fonts
//
//  Created by FISC on 2017/8/22.
//  Copyright © 2017年 FISC. All rights reserved.
//

#import "FavoritesList.h"

@interface FavoritesList ()
@property(nonatomic,strong) NSMutableArray *favorites;
@end

@implementation FavoritesList

+(instancetype) sharedFavoritesList {
    static FavoritesList *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSArray *storedFavorites = [defaults objectForKey:@"favorites"];
        if (storedFavorites) {
            self.favorites = [storedFavorites mutableCopy];
        } else {
            self.favorites = [NSMutableArray array];
        }
    }
    return self;
}

-(void) saveFavorites {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.favorites forKey:@"favorites"];
    [defaults synchronize];
}

-(void) addFavorite:(id)item {
    [_favorites insertObject:item atIndex:0];
    [self saveFavorites];
}

-(void) removeFavorite:(id)item {
    [_favorites removeObject:item];
    [self saveFavorites];
}
@end
