//
//  ScoreCalculator.m
//  hyakuten
//
//  Created by James Morris on 06/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "ScoreCalculator.h"

@implementation ScoreCalculator

+(double) calculatePercentageScore: (int) score withTotalQuestions: (int) numberOfQuestions {
    
    return ((float) score / (float)numberOfQuestions) * 100;
}

@end
