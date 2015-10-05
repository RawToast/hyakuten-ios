//
//  HStack.h
//  hyakuten
//
//  Created by James Morris on 05/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface HStack : NSMutableArray

-(void) push:(Question*) object;

-(Question *) pop;

@end
