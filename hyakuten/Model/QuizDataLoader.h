//
//  QuizDataLoader.h
//  hyakuten
//
//  Created by James Morris on 06/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuizDataLoader.h"
#import "Quiz.h"

@interface QuizDataLoader : NSObject

+(void) generateQuizData: (NSManagedObjectContext*) moc;

@end
