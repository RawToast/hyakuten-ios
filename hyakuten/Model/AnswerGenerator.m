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
    
    NSMutableArray <NSString*> *validParticles =
        [[NSMutableArray alloc] initWithObjects: @"は", @"が", @"を", @"の", @"に", @"へ", nil];
    
    for (NSUInteger i = validParticles.count - 1; i > 0; i--) {
        [validParticles exchangeObjectAtIndex:i
                            withObjectAtIndex:arc4random_uniform((u_int32_t)i + 1)];
    }
    

    for (int i = 0; i < 4; i++) {
        [ answers addObject: [validParticles objectAtIndex:i]];
    }

}

@end
