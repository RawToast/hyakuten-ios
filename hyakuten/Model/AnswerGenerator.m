//
//  AnswerGenerator.m
//  hyakuten
//
//  Created by James Morris on 01/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "AnswerGenerator.h"
#import "HType.h"
#import "HStack.h"

@implementation AnswerGenerator

+(NSMutableArray*) generateAnswersForQuestion:(Question *)question {
    
    NSCountedSet <NSString*> *answers = [[NSCountedSet alloc] initWithObjects: question.answer, nil];

    if ( [ question.closeType containsString: PARTICLE]){
        [ self generateParticleAnswers: answers];
    }
    
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:[answers allObjects] copyItems:YES];
    return result;
}


+(void) generateParticleAnswers: (NSCountedSet<NSString*>*) answers {
    
    NSMutableArray <NSString*> *validParticles =
        [[NSMutableArray alloc] initWithObjects: @"は", @"が", @"を", @"の", @"に", @"へ", nil];
    
    for (NSUInteger i = validParticles.count - 1; i > 0; i--) {
        [validParticles exchangeObjectAtIndex:i
                            withObjectAtIndex:arc4random_uniform((u_int32_t)i + 1)];
    }
    

    while (answers.count < 4) {
        [ answers addObject: [validParticles pop]];
    }

}

@end
