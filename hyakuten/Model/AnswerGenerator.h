//
//  AnswerGenerator.h
//  hyakuten
//
//  Created by James Morris on 01/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface AnswerGenerator : NSObject

+ (NSMutableArray*) generateAnswersForQuestion: (Question*) question;

@end
