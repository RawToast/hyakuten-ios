//
//  Question.m
//  hyakuten
//
//  Created by James Morris on 01/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "Question.h"
#import "AnswerGenerator.h"

@implementation Question

+ (Question *) createQuestion:(NSManagedObjectContext *)moc {
    Question *question = (Question *) [NSEntityDescription
                                       insertNewObjectForEntityForName:@"Question"
                                       inManagedObjectContext:moc];
    
    return question;
}

- (NSSet<NSString *>*) generateAnswers {    
    return [ AnswerGenerator generateAnswersForQuestion: self];
}

- (BOOL) isCorrectAnswer:(NSString *)chosenAnswer {
    return [self.answer isEqual: chosenAnswer];
}

@end
