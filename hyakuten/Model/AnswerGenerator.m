//
//  AnswerGenerator.m
//  hyakuten
//
//  Created by James Morris on 01/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "AnswerGenerator.h"
#import "HType.h"

@implementation AnswerGenerator



+(NSSet <NSString*>*) generateAnswersForQuestion:(Question *)question {
    
    NSCountedSet <NSString*> *answers = [[NSCountedSet alloc] initWithObjects: question.answer, nil];

    if ( question.closeType == PARTICLE ){
        [ self generateParticleAnswers: answers];
    
    }
    
    
    return answers;
}


+(void) generateParticleAnswers: (NSCountedSet<NSString*>*) answers {
    
    NSMutableSet <NSString*> *validParticles = [[NSMutableSet alloc] initWithObjects: @"は", @"が", @"を", @"の", @"に", @"へ", nil];
    while (answers.count < 4) {
         NSArray *particles = [ validParticles allObjects];

        [answers addObject: [ particles objectAtIndex: arc4random_uniform(particles.count - 1)]];
    }
}

@end
