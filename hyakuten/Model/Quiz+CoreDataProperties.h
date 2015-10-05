//
//  Quiz+CoreDataProperties.h
//  hyakuten
//
//  Created by James Morris on 01/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Quiz.h"

NS_ASSUME_NONNULL_BEGIN

@interface Quiz (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *completed;
@property (nullable, nonatomic, retain) NSDate *completionDate;
@property (nullable, nonatomic, retain) NSNumber *highscore;
@property (nullable, nonatomic, retain) NSSet<Question *> *questions;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *section;
@property (nonatomic, retain) NSNumber *priority;
@property (nullable, nonatomic, retain) NSString *information;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSString *videoId;

@end

@interface Quiz (CoreDataGeneratedAccessors)

- (void)addQuestionsObject:(Question *)value;
- (void)removeQuestionsObject:(Question *)value;
- (void)addQuestions:(NSSet<Question *> *)values;
- (void)removeQuestions:(NSSet<Question *> *)values;

@end

NS_ASSUME_NONNULL_END
