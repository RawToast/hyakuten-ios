//
//  QuizViewController.m
//  hyakuten
//
//  Created by James Morris on 25/09/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "QuizViewController.h"
#import "MainTableViewController.h"
#import "Question.h"
#import "HStack.h"
#import "QuizManager.h"
#import "AlertControllerFactory.h"
#import <Social/Social.h>
#import "ScoreCalculator.h"
#import "Settings.h"

NSString *const RETURN_TO_MAIN_MENU_SEGUE = @"ReturnFromQuiz";

@interface QuizViewController ()
    // Zero based, but incremented after posting each question. Resulting in a correct count.
    @property short int correctCount;
    @property QuizManager *quizManager;
    @property short int score;
@end

@implementation QuizViewController

- (void)viewDidLoad { 
    [super viewDidLoad];
    
    if (self.quiz == nil) {
        NSLog(@"Navigated to the quiz view with no quiz data!");
        abort();
    }
    // Formatting
    [ self formatButtons];
    
    // Fetch first question
    self.score = 0;
    self.quizManager = [[QuizManager alloc] initWithQuiz: self.quiz];
    Question *firstQuestion = [self.quizManager currentQuestion];
    [ self prepareViewForQuestion : firstQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) prepareViewForQuestion: (Question *) question {
    NSMutableArray *answers = [question generateAnswers];
    [ self setAnswerButtons : answers];
    float nextProgress = self.progressBar.progress + 0.1f;
    self.progressBar.progress = nextProgress;
    self.quizLabel.text = self.quiz.name;
    self.shownQuestion.text = question.sentenceClosed;
    self.questionInfo.text = @"Select the correct particle to fill in the blank"; //question.information;
}

#pragma Button control

- (IBAction)chooseAnswerA:(id)sender {
    [ self handleButtonPress: sender];
}
- (IBAction)chooseAnswerB:(id)sender {
    [ self handleButtonPress: sender];
}
- (IBAction)chooseAnswerC:(id)sender {
    [ self handleButtonPress: sender];
}
- (IBAction)chooseAnswerD:(id)sender {
    [ self handleButtonPress: sender];
}


// Private methods
- (void) handleButtonPress: (UIButton*) button {
    [self isCorrectAnswer: button];
    [self moveToNextQuestionOrFinishQuiz];
}

- (BOOL) isCorrectAnswer: (UIButton*)button {
    Question *question = [ self.quizManager currentQuestion ];
    BOOL result = [ question.answer isEqualToString: button.titleLabel.text];
    if (result) {
        self.score++;
        NSLog(@"User chose correct answer %@, current score: %i", question.answer, self.score);
    }
    return result;
}

#pragma View flow

- (void) moveToNextQuestionOrFinishQuiz {
    if ([self.quizManager isLastQuestion]) {
        NSLog(@"User reached end of the quiz");
        BOOL showAlert = YES;
        if ( [self perfectScore]) {
            [self tweetScore];
            showAlert = NO;
        }
        [ self endQuiz: showAlert];
        
    } else {
        NSLog(@"Moving to next question");
        Question *question = [ self.quizManager nextQuestion];
        [ self prepareViewForQuestion: question];
    }
}

- (BOOL) perfectScore {
    short int totalQuestions = [ self.quiz.questions count ];
    NSLog(@"User score was %i out of %i", self.score, totalQuestions);
    return self.score == totalQuestions;
}

- (void) endQuiz: (BOOL) showAlert {
    NSLog(@"Ending quiz %@", self.quiz.name);
    
    double finalScore = [ ScoreCalculator calculatePercentageScore:self.score
                                                withTotalQuestions:(int)self.quiz.questions.count];
    
    [ self.quizManager updateWithScore: [NSNumber numberWithDouble:finalScore]];
    NSError *error = nil;
    [ self.moc save:&error];
    
    // Show alternative finishing screen
    if (showAlert){
    NSString *message = [ NSString stringWithFormat:@"Quiz %@ completed, score: %.1f%%",
                         self.quiz.name,
                         finalScore];
        [ self presentQuizFinishedAlert: message];
    } else {
        [self.navigationController popToRootViewControllerAnimated:YES];     }
}

-(void) presentQuizFinishedAlert: (NSString *) message {
    
    // End quiz modal
    UIAlertController *endAlert = [UIAlertController alertControllerWithTitle:@"Quiz completed!"
                                                                      message:message
                                                               preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         [endAlert dismissViewControllerAnimated:YES completion:nil];
                                                         [self.navigationController popToRootViewControllerAnimated:YES];
                                                     }];
    
    [ endAlert addAction:okAction];
    [ self presentViewController: endAlert animated:YES completion:nil];
    
}


- (void) tweetScore {
    
    NSNumber *tweet = [Settings fetchSettings:self.moc].tweetResults;
    NSLog(@"%@", tweet);
    
    if ([tweet intValue] == 0) {
        // Check if user has twitter setup on device
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
        {
            SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            
            // Tweet text building should be in another method
            NSString *tweetText;
            NSString *tweetSuffix = [ NSString stringWithFormat:@" %@ on #Hyakuten!", self.quiz.name];
            
            if ([ self perfectScore]){
                tweetText = [Settings fetchSettings:self.moc].perfectScoreTweetText;
            } else {
                tweetText = [Settings fetchSettings:self.moc].highscoreTweetText;
            }
            
            tweetText = [ tweetText stringByAppendingString: tweetSuffix];
            [tweetSheet setInitialText: tweetText];

            [self presentViewController:tweetSheet animated:YES completion:nil];
        }
        else
        {
            // Not setup account
            UIAlertController *twitterAlert = [UIAlertController alertControllerWithTitle:@"Sorry"
                                                                           message:@"You can't send a tweet right now, make your device has an internet connection and you have at least one Twitter account setup"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            void (^dismiss)(UIAlertAction *action) = ^(UIAlertAction *action){
                [twitterAlert dismissViewControllerAnimated:YES completion:nil];
                [self.navigationController popToRootViewControllerAnimated:YES];
            };
            
            [ AlertControllerFactory addOKActionToAlert:twitterAlert withHandler:dismiss];
            
            [ self presentViewController: twitterAlert animated:YES completion:nil];
        }
    }
}

#pragma Button formatting

- (void) setAnswerButtons: (NSMutableArray *) answers {
    
    [self.answerButtonA setTitle: [answers pop]
                        forState:UIControlStateNormal];
    [self.answerButtonB setTitle: [answers pop]
                        forState:UIControlStateNormal];
    [self.answerButtonC setTitle: [answers pop]
                        forState:UIControlStateNormal];
    [self.answerButtonD setTitle: [answers pop]
                        forState:UIControlStateNormal];
}

- (void) formatButtons {
    NSArray* bArray = [[NSArray alloc] initWithObjects:self.answerButtonA, self.answerButtonB,
                       self.answerButtonC, self.answerButtonD, nil];
    
    for (UIButton *button in bArray) {
        button.backgroundColor = [UIColor clearColor];
        button.layer.cornerRadius = 5;
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    }
}
@end
