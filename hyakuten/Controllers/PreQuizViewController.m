//
//  PreQuizViewController.m
//  hyakuten
//
//  Created by James Morris on 08/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "PreQuizViewController.h"

#import "QuizViewController.h"
#import "InformationViewController.h"

NSString *const NAVIGATE_TO_QUIZ_SEGUE = @"NavigateToQuizView";
NSString *const NAVIGATE_TO_INFO_SEGUE = @"NavigateToInfoView";


@interface PreQuizViewController ()

@end

@implementation PreQuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    return 2;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


#pragma mark - Navigation

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Did select row at index path %@", indexPath);
    int row = (int) indexPath.row;
    if (row == 0) { // quiz
        NSLog(@"Navigating to quiz %@", self.quiz.name);
        [ self performSegueWithIdentifier: NAVIGATE_TO_QUIZ_SEGUE sender:self.quiz];
    } else if (row == 1){ // video
        NSLog(@"Viewing video page for %@", self.quiz.name);
        [ self performSegueWithIdentifier: NAVIGATE_TO_INFO_SEGUE sender:self.quiz];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString: NAVIGATE_TO_QUIZ_SEGUE]) {
        QuizViewController *controller = [segue destinationViewController];
        controller.moc = self.moc;
        controller.quiz = (Quiz*) sender;
        NSLog(@"Passed moc to QuizViewController");
    } else if ([[segue identifier] isEqualToString: NAVIGATE_TO_INFO_SEGUE]) {
        InformationViewController *controller = [ segue destinationViewController];
        controller.moc = self.moc;
        controller.quiz = (Quiz*) sender;
        NSLog(@"Passed moc to InformationViewController");
    }
}


@end
