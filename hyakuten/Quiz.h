//
//  Quiz.h
//  hyakuten
//
//  Created by James Morris on 01/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question;

NS_ASSUME_NONNULL_BEGIN

@interface Quiz : NSManagedObject

+ (Quiz*) createQuiz:(NSManagedObjectContext *) moc;

- (void) addQuestion:(Question *) question;

- (void) addQuestionsFromSet: (NSSet<Question *> *) questions;

- (BOOL) isNewHighScore;

- (void) markAsComplete;

@end

NS_ASSUME_NONNULL_END

#import "Quiz+CoreDataProperties.h"
