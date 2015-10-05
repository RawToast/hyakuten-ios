//
//  HStack.m
//  hyakuten
//
//  Created by James Morris on 05/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "HStack.h"

@implementation NSMutableArray (HStack)

-(void) push:(id) object{
    [ self addObject:object];
}

-(id) pop {
    id lastItem = [self lastObject];
    [ self removeLastObject];
    return lastItem;
}
@end
