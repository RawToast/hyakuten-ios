//
//  Settings.m
//  hyakuten
//
//  Created by James Morris on 07/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "Settings.h"
#import <CoreData/CoreData.h>

@interface Settings()
    @property NSManagedObjectContext *moc;
    //@property (nullable, nonatomic, retain) NSNumber *lightTheme;
@end

@implementation Settings
    @synthesize moc;
    //@synthesize lightTheme = _lightTheme;

+ (instancetype) fetchSettings:(NSManagedObjectContext *)managedObjectContext {
    
    static Settings *singleInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleInstance = [ self createInstance: managedObjectContext];
    });
    
    return singleInstance;
}

+ (instancetype) createInstance: (NSManagedObjectContext *) managedObjectContent {
    Settings *settings;
    
    NSError *error = nil;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Settings"
                                                         inManagedObjectContext:managedObjectContent];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity: entityDescription];
    
    NSArray *results = [ managedObjectContent executeFetchRequest:fetchRequest
                                                            error:&error];
    
    if ( results.count == 0) {
        // Defaults set in model
        NSLog(@"No saved settings found, creating new default settings");
        settings  = (Settings*) [NSEntityDescription insertNewObjectForEntityForName:@"Settings"
                                                                        inManagedObjectContext:managedObjectContent];
    } else{
        NSLog(@"Loading user's previous settings");
        settings = (Settings *)[ results objectAtIndex: 0];
    }
    settings.moc = managedObjectContent;
    
    return settings;
}

- (void) save {
    NSError *error;
    [ self.moc save: &error];
    NSLog(@"Saving settings...");
    if (error) {
        NSLog(@"Failed to save settings: %@", error);
    }
    
}

/*- (void) setTweetResults:(NSNumber *)tweetResults {
    NSError *error = nil;
    self.tweetResults = tweetResults;
    [ self.moc save: &error];
    
    if (error) {
        NSLog(@"Failed to save update to tweetResults value: %@", error);
    }
}

- (void) setLightTheme:(NSNumber *)lightTheme {
    NSError *error = nil;
    _lightTheme = lightTheme;
    [ self.moc save: &error];
    
    if (error) {
        NSLog(@"Failed to save update to lightTheme value: %@", error);
    }
}

- (void) setAutoPlayVideo:(NSNumber *)autoPlayVideo {
    NSError *error = nil;
    self.autoPlayVideo = autoPlayVideo;
    [ self.moc save: &error];
    
    if (error) {
        NSLog(@"Failed to save update to autoPlayVideo value: %@", error);
    }
}*/

@end
