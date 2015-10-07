//
//  SettingsViewController.h
//  hyakuten
//
//  Created by James Morris on 30/09/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController <UITextFieldDelegate>


- (void) hideKeyboard;
- (IBAction)clickedChangeVideoSettings:(id)sender;
- (IBAction)changeTheme:(id)sender;
- (IBAction)changeIfTweetEnabled:(id)sender;
- (IBAction)setTweetTextForPerfectScore:(id)sender;
- (IBAction)setTweetTextForHighscore:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *autoPlayVideo;
@property (weak, nonatomic) IBOutlet UISegmentedControl *themeControl;

@property (weak, nonatomic) IBOutlet UITextField *perfectScoreTweetField;
@property (weak, nonatomic) IBOutlet UITextField *highscoreTweetField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tweetField;

@property (strong, nonatomic) NSManagedObjectContext *moc;

@end
