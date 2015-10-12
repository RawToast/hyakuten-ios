//
//  InformationView.m
//  hyakuten
//
//  Created by James Morris on 07/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "InformationViewController.h"
#import "QuizViewController.h"
#import "Settings.h"

@implementation InformationViewController

NSString *const NAVIGATE_FROM_INFO_TO_QUIZ_SEGUE = @"InfoToQuiz";

- (void)viewDidLoad {
    [ super viewDidLoad];

    //gSettings *settings = [ Settings fetchSettings: self.moc ];
    //NSNumber *shouldPlayVideo = settings.autoPlayVideo;
    
    Settings *settings = [ Settings fetchSettings:[self moc ]];
    
    NSNumber *autoPlay = settings.autoPlayVideo;
    
    NSDictionary *params = @{ @"playsinline" : @1,
                              @"autoplay" : autoPlay, };
    [ self.playerView loadWithVideoId:self.quiz.videoId playerVars:params];
    }

- (IBAction)continueButtonClicked:(id)sender {
    [ self performSegueWithIdentifier:NAVIGATE_FROM_INFO_TO_QUIZ_SEGUE sender:self.quiz];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString: NAVIGATE_FROM_INFO_TO_QUIZ_SEGUE]) {
        QuizViewController *controller = [segue destinationViewController];
        controller.moc = self.moc;
        controller.quiz = (Quiz*) sender;
        NSLog(@"Passed moc to QuizViewController");
    }
    
}
@end
