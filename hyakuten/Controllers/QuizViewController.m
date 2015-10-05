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
#import "QuizManager.h"

@interface QuizViewController ()
    // Zero based, but incremented after posting each question. Resulting in a correct count.
    @property short int correctCount;
    @property QuizManager *quizManager;
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
    
    
    // Setup first question, question logic should be moved to a seperate class
    self.quizManager = [[QuizManager alloc] initWithQuiz: self.quiz];
    Question *firstQuestion = [self.quizManager currentQuestion];

    // Format buttons
    
    NSMutableArray *answers = [firstQuestion generateAnswers];
    [ self setAnswerButtons : answers];
    [ self prepareViewForQuestion : firstQuestion];
}

- (void) moveToNextQuestionOrFinishQuiz {
    if ([self.quizManager isLastQuestion]) {
        // END QUIZ
        NSLog(@"User reached end of the quiz");
    } else {
        NSLog(@"Moving to next question");
        Question *question = [ self.quizManager nextQuestion];
        [ self prepareViewForQuestion: question];
    }
}

- (void) prepareViewForQuestion: (Question *) question {
    self.quizLabel.text = self.quiz.name;
    self.shownQuestion.text = question.sentenceClosed;
    self.questionInfo.text = @"Select the correct particle to fill in the blank"; //question.information;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Button controls

- (IBAction)chooseAnswerA:(id)sender {
    if ( [self isCorrectAnswer:self.answerButtonA]) {
        // Move on to next question
        [ self moveToNextQuestionOrFinishQuiz];
        
    }
    
}
- (IBAction)chooseAnswerB:(id)sender {
    if ( [self isCorrectAnswer:self.answerButtonB]) {
        [ self moveToNextQuestionOrFinishQuiz];
    }
}
- (IBAction)chooseAnswerC:(id)sender {
    if ( [self isCorrectAnswer:self.answerButtonC]) {
        [ self moveToNextQuestionOrFinishQuiz];
    }
}
- (IBAction)chooseAnswerD:(id)sender {
    if ( [self isCorrectAnswer:self.answerButtonD]) {
        [ self moveToNextQuestionOrFinishQuiz];
    }
}

- (BOOL) isCorrectAnswer: (UIButton*)button {
    Question *question = [ self.quizManager currentQuestion ];
    BOOL result = [ question.answer isEqualToString: button.titleLabel.text];
    if (result) {
        NSLog(@"User chose correct answer %@", question.answer);
    }
    return result;
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
@end