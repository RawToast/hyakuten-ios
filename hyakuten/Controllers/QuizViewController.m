//
//  QuizViewController.m
//  hyakuten
//
//  Created by James Morris on 25/09/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "QuizViewController.h"
#import "Question.h"
#import "HStack.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

- (void)viewDidLoad { 
    [super viewDidLoad];
    
    if (self.quiz == nil) {
        NSLog(@"Navigated to the quiz view with no quiz data!");
        abort();
    }
    
    // Setup first question
    Question *question = [self.quiz.questions anyObject];
    self.quizLabel.text = self.quiz.name;
    self.shownQuestion.text = question.sentenceClosed;
    self.questionInfo.text = @"Select the correct particle to fill in the blank"; //question.information;
    
    // Format buttons
    NSMutableArray *answers = [question generateAnswers];
    [ self setAnswerButtons: answers];
    [ self formatButtons];
    
}


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
