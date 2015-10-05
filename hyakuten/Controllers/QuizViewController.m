//
//  QuizViewController.m
//  hyakuten
//
//  Created by James Morris on 25/09/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "QuizViewController.h"
#import "Question.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

- (void)viewDidLoad { 
    [super viewDidLoad];
    
    if (self.quiz == nil) {
        NSLog(@"Navigated to the quiz view with no quiz data!");
        abort();
    }
    
    Question *question = [self.quiz.questions anyObject];
    self.quizLabel.text = self.quiz.name;
    [self.answerButtonA setTitle:question.answer forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chooseAnswerA:(id)sender {
}
- (IBAction)chooseAnswerB:(id)sender {
}
- (IBAction)chooseAnswerC:(id)sender {
}
- (IBAction)chooseAnswerD:(id)sender {
}

@end
