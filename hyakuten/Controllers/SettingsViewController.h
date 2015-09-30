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

@property (weak, nonatomic) IBOutlet UISegmentedControl *languageControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *themeControl;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@end
