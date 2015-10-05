//
//  HStack.h
//  hyakuten
//
//  Created by James Morris on 05/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (StackExtension)

- (void) push: (id) question;

- (id) pop;

@end
