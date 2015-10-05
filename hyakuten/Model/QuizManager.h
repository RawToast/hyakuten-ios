//
//  QuizManager.h
//  hyakuten
//
//  Created by James Morris on 05/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quiz.h"
#import "Question.h"

@interface QuizManager : NSObject

-(QuizManager*) initWithQuiz:(Quiz*) quiz;

-(Question*) currentQuestion;

-(Question*) nextQuestion;

-(Question*) previousQuestion;

-(BOOL) isLastQuestion;

@end
