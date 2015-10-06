//
//  QuizManager.m
//  Holds the quiz's current state and provides access to the questions.
//
//  Created by James Morris on 05/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "QuizManager.h"
@interface QuizManager()
@property Quiz *quiz;
@property NSArray<Question*>* questionArray;
@property short int questionCount;
@end


@implementation QuizManager
@synthesize questionArray;
@synthesize quiz;

-(QuizManager*) initWithQuiz:(Quiz*) nQuiz {
    self = [super init];
    self.quiz = nQuiz;
    
    self.questionCount = 0;
    self.questionArray = [ self.quiz.questions allObjects];

    NSLog(@"QuizManager loading quiz, with previous highscore %@", self.quiz.highscore);
    
    return self;
}

-(Question*) currentQuestion {
    return [self.questionArray objectAtIndex: self.questionCount];
}

-(Question*) nextQuestion {
    if ( [self isLastQuestion]){
        return nil;
    }
    self.questionCount++;
    Question* question = [ self.questionArray objectAtIndex: self.questionCount];
    return question;
}

-(Question*) previousQuestion {
    self.questionCount--;
    Question* question = [ self.questionArray objectAtIndex: self.questionCount];
    return question;
}

-(BOOL) isLastQuestion {
    short int counter = self.questionCount + 1;
    return counter >= self.questionArray.count;
}

-(void) updateWithScore:(NSNumber*) score {
    self.quiz.highscore = score;
}


@end
