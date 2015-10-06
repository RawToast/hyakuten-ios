//
//  ScoreCalculator.h
//  hyakuten
//
//  Created by James Morris on 06/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoreCalculator : NSObject

+(double) calculatePercentageScore: (int) score withTotalQuestions:(int) numberOfQuestions;

@end
