//
//  ViewController.h
//  hyakuten
//
//  Created by James Morris on 25/09/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *answerButtonA;
@property (weak, nonatomic) IBOutlet UIButton *answerButtonB;
@property (weak, nonatomic) IBOutlet UIButton *answerButtonC;
@property (weak, nonatomic) IBOutlet UIButton *answerButtonD;

- (IBAction)chooseAnswerA:(id)sender;
- (IBAction)chooseAnswerB:(id)sender;
- (IBAction)chooseAnswerC:(id)sender;
- (IBAction)chooseAnswerD:(id)sender;

@end

