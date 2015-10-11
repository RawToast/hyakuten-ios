//
//  HQuizUpdateManager.h
//  hyakuten
//
//  Created by James Morris on 11/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HQuizUpdateManager : NSObject

-(void) checkForUpdates: (int) currentVersion;

@property (readonly) BOOL updatesAvailable;

@end
