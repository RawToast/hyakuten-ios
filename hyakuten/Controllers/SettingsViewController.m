//
//  SettingsViewController.m
//  hyakuten
//
//  Created by James Morris on 30/09/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "SettingsViewController.h"
#import "Settings.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [ super viewDidLoad];
    [ self loadSettings];
    [ self configureTextFields];
}

- (void) loadSettings {
    Settings *settings = [ Settings fetchSettings: self.moc];
   
    self.autoPlayVideo.selectedSegmentIndex = [ [settings autoPlayVideo] integerValue];
    self.themeControl.selectedSegmentIndex = [ [settings lightTheme] integerValue];
    self.tweetField.selectedSegmentIndex = [ [settings tweetResults] integerValue];
    
    self.perfectScoreTweetField.text = settings.perfectScoreTweetText;
    self.highscoreTweetField.text = settings.highscoreTweetText;
    
}


- (void) configureTextFields {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(hideKeyboard)];
    [ self.view addGestureRecognizer: tapGesture];
    self.perfectScoreTweetField.delegate = self;
    self.perfectScoreTweetField.returnKeyType = UIReturnKeyNext;
    self.perfectScoreTweetField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    self.highscoreTweetField.delegate = self;
    self.highscoreTweetField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.highscoreTweetField.returnKeyType = UIReturnKeyDone;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

#pragma - Hide Keyboard logic
- (void) hideKeyboard {
    [ self.perfectScoreTweetField resignFirstResponder];
    [ self.highscoreTweetField resignFirstResponder];
}

- (IBAction)clickedChangeVideoSettings:(id)sender {
    Settings *settings = [ Settings fetchSettings: self.moc];
    int indexVal = (int)self.autoPlayVideo.selectedSegmentIndex;
    settings.autoPlayVideo = [NSNumber numberWithInt: indexVal];
    [ settings save];
}

- (IBAction)changeTheme:(id)sender {
    Settings *settings = [ Settings fetchSettings: self.moc];
    int indexVal = (int) self.themeControl.selectedSegmentIndex;
    
    settings.lightTheme = [NSNumber numberWithInt:indexVal];
    [ settings save];
}

- (IBAction)changeIfTweetEnabled:(id)sender {
    Settings *settings = [ Settings fetchSettings: self.moc];
    int indexVal = (int)  self.tweetField.selectedSegmentIndex;

    settings.tweetResults = [NSNumber numberWithInt:indexVal];
    [ settings save];
}

- (IBAction)setTweetTextForPerfectScore:(id)sender {
    Settings *settings = [ Settings fetchSettings: self.moc];
    settings.perfectScoreTweetText = self.perfectScoreTweetField.text;
    [ settings save];
}

- (IBAction)setTweetTextForHighscore:(id)sender {
    Settings *settings = [ Settings fetchSettings: self.moc];
    settings.highscoreTweetText = self.highscoreTweetField.text;
    [ settings save];

}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.perfectScoreTweetField){
        [ self.highscoreTweetField becomeFirstResponder];
    } else {
        [self becomeFirstResponder];
        [ textField resignFirstResponder];
    }

    return YES;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
