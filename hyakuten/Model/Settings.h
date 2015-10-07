//
//  Settings.h
//  hyakuten
//
//  Created by James Morris on 07/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Quiz.h"

NS_ASSUME_NONNULL_BEGIN

@interface Settings : NSManagedObject

+ (instancetype) fetchSettings:(NSManagedObjectContext *) moc;

- (void) save;

@end

NS_ASSUME_NONNULL_END

#import "Settings+CoreDataProperties.h"
