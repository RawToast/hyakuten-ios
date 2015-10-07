//
//  Settings+CoreDataProperties.h
//  hyakuten
//
//  Created by James Morris on 07/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Settings.h"

NS_ASSUME_NONNULL_BEGIN

@interface Settings (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *tweetResults;
@property (nullable, nonatomic, retain) NSNumber *lightTheme;
@property (nullable, nonatomic, retain) NSNumber *autoPlayVideo;

@end

NS_ASSUME_NONNULL_END
