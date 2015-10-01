//
//  Question.h
//  hyakuten
//
//  Created by James Morris on 01/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSManagedObject

+ (Question *) createQuestion: (NSManagedObjectContext *) moc;

- (NSSet<NSString *>*) generateAnswers;

@end

NS_ASSUME_NONNULL_END

#import "Question+CoreDataProperties.h"
