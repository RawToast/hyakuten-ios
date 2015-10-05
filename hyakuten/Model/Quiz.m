//
//  Quiz.m
//  hyakuten
//
//  Created by James Morris on 01/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "Quiz.h"
#import "HStack.h"
#import "Question.h"

@interface Quiz()
@property HStack *_questions;
@end

@implementation Quiz

+ (Quiz*) createQuiz:(NSManagedObjectContext *) moc {
    return (Quiz*) [ NSEntityDescription insertNewObjectForEntityForName:@"Quiz" inManagedObjectContext:moc];
}

- (Question *) nextQuestion {
    if (self._questions == nil) {
        self._questions = [[HStack alloc] initWithArray: [self.questions allObjects] copyItems:YES];
    }
    
    Question *question = [self._questions pop ];
    
    return question;
}

- (void) addQuestion:(Question *) question {
    if (self.questions != nil) {
        NSMutableSet *copy = [self.questions mutableCopy];
        [copy addObject: question];
        self.questions = copy;
    } else {
        self.questions = [[NSSet alloc] initWithObjects:question, nil];
    }
}

- (void) addQuestionsFromSet: (NSSet<Question *> *) questions {
    if (self.questions != nil){
        NSMutableSet *copy = [ self.questions mutableCopy];
        [copy setByAddingObjectsFromSet:questions];
        self.questions = copy;
    } else {
        self.questions = [[NSSet alloc] initWithSet:questions];
    }
}

- (BOOL) isNewHighScore {
    // Actually check the score?
    return YES;
}

- (void) markAsComplete {
    // Twitter code here
    self.completed = [NSNumber numberWithBool:YES];
}

@end
