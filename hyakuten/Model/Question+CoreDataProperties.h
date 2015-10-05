//
//  Question+CoreDataProperties.h
//  hyakuten
//
//  Created by James Morris on 01/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Question.h"

NS_ASSUME_NONNULL_BEGIN

@interface Question (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *sentence;
@property (nullable, nonatomic, retain) NSString *sentenceClosed;
@property (nullable, nonatomic, retain) NSString *answer;
@property (nullable, nonatomic, retain) NSString *closeType;
@property (nullable, nonatomic, retain) NSString *closeBase;
@property (nullable, nonatomic, retain) NSString *closeTense;
@property (nullable, nonatomic, retain) NSManagedObject *quiz;
@property (nullable, nonatomic, retain) NSString *information;

@end

NS_ASSUME_NONNULL_END
