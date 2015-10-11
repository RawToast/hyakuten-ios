//
//  HQuizUpdateManager.m
//  hyakuten
//
//  Created by James Morris on 11/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "HQuizUpdateManager.h"
#import "AFNetworking.h"


@interface HQuizUpdateManager()
// Override interface for write access
@property (readwrite) BOOL updatesAvailable;
@property (atomic) BOOL processing;

@end

@implementation HQuizUpdateManager

const NSString* ROOT_URL = @"https://demo7387664.mockable.io/";

-(void) checkForUpdates:(int)currentVersion {
    [self hasUpdates:currentVersion];
}

-(void) hasUpdates: (int) currentVersion {
    NSLog(@"Checking for updates, current version is: %d", currentVersion);
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@update", ROOT_URL]];
    NSLog(@"Request url is: %@", URL);
    // Initialize Request Operation
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:URL]];
    
    // Configure Request Operation
    [requestOperation setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        // Process Response Object
        NSLog(@"Got response");
        NSDictionary *response = (NSDictionary*) responseObject;
        
        self.updatesAvailable = (BOOL) [ response objectForKey:@"updatesAvailable"];
        NSLog(@"Response for update check: %d", self.updatesAvailable);
        [ self retrieveUpdates: currentVersion];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Checking for updates failed");
        [ self handleFailure:operation withError:error];
        
    }];
    
    // Start Request Operation
    [requestOperation start];
}

-(void) retrieveUpdates: (int) currentVersion {
    NSLog(@"Retrieving new questions since version: %d", currentVersion);
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@fetchQuestions?fromVersion=%d", ROOT_URL, currentVersion]];
    
    // Initialize Request Operation
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:URL]];
    
    // Configure Request Operation
    [requestOperation setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Retrieved new updates");
        NSDictionary *response = (NSDictionary*) responseObject;
        
        NSNumber *questions = (NSNumber*) [ response objectForKey:@"questionCount"];
        NSLog(@"Found %@ new questions", questions);

        // Pass to a quiz db manager, which should encapsute the QuizDataLoader
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [ self handleFailure:operation withError:error];
    }];
    
    // Start Request Operation
    [requestOperation start];
    
}

-(void) handleFailure: (AFHTTPRequestOperation*) operation withError: (NSError*) error {
    NSLog(@"Checking for updates failed with error %@", error);
    self.processing = NO;
}

@end
