//
//  ViewController.h
//  hyakuten
//
//  Created by James Morris on 25/09/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quiz.h"

@interface QuizViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *moc;

@property (strong, nonatomic) Quiz *quiz;
@property (weak, nonatomic) IBOutlet UILabel *quizLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionInfo;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@property (weak, nonatomic) IBOutlet UILabel *shownQuestion;
@property (weak, nonatomic) IBOutlet UIButton *answerButtonA;
@property (weak, nonatomic) IBOutlet UIButton *answerButtonB;
@property (weak, nonatomic) IBOutlet UIButton *answerButtonC;
@property (weak, nonatomic) IBOutlet UIButton *answerButtonD;

- (IBAction)chooseAnswerA:(id)sender;
- (IBAction)chooseAnswerB:(id)sender;
- (IBAction)chooseAnswerC:(id)sender;
- (IBAction)chooseAnswerD:(id)sender;

@end

