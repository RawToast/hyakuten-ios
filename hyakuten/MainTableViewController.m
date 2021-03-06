//
//  MainTableViewController.m
//  hyakuten
//
//  Created by James Morris on 29/09/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "MainTableViewController.h"
#import "SettingsViewController.h"
#import "PreQuizViewController.h"
#import "AlertControllerFactory.h"
#import "QuizSelectionTableView.h"
#import "Quiz.h"

NSString *const NAVIGATE_TO_SETTINGS_SEGUE = @"NavigateToSettings";
NSString *const NAVIGATE_TO_PRE_QUIZ_SEGUE = @"NavigateToPreQuiz";


@interface MainTableViewController ()
@end

@implementation MainTableViewController

@synthesize fetchResultsController = _fetchResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIEdgeInsets inset = UIEdgeInsetsMake(10, 0, 0, 0);
    self.tableView.contentInset = inset;
    NSError *error = nil;
    if (![[self fetchResultsController] performFetch: &error]) {
    
        NSLog(@"Error fetching core data %@", error);
        abort();
    }
    
    [ self showFirstRunDialog ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSUInteger sectionCount = [self.fetchResultsController sections].count;
    NSLog(@"Found %@ sections in table view", @(sectionCount));
    return sectionCount;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchResultsController sections] objectAtIndex:section];
    NSInteger numberOfObjects = [ sectionInfo numberOfObjects];
    
    NSLog(@"Returning numberOfRowsInSection as %@, for section %li", @(numberOfObjects), (long)section);
    return numberOfObjects;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Getting table cell for indexPath %@", indexPath);
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        NSLog(@"Manually creating the cell");
        cell = [[UITableViewCell alloc] init];
    }
    

    // The results need sorting in the resultsController
    Quiz *quiz = [ self.fetchResultsController objectAtIndexPath: indexPath];
    
    cell.textLabel.text = quiz.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSLog(@"Returning table cell with title %@",
          quiz.name);

    return cell;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // Believe this should not be using *name
    NSLog(@"Fetching header for section");
    NSString *sectionTitle = [[[self.fetchResultsController sections]objectAtIndex:section] name];
    NSLog(@"Title for header in section %@ is %@", @(section), sectionTitle);
    return sectionTitle;
}



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


#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
     NSLog(@"Did select row at index path %@", indexPath);
     Quiz *quiz = [ self.fetchResultsController objectAtIndexPath: indexPath];
     NSUInteger count = quiz.questions.count;
     
     NSLog(@"Fetched Quiz %@ with %lu questions", quiz.name, (unsigned long)count);
     
     [self performSegueWithIdentifier:NAVIGATE_TO_PRE_QUIZ_SEGUE
                              sender: quiz];
 }


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString: NAVIGATE_TO_SETTINGS_SEGUE]) {
        SettingsViewController *controller = [ segue destinationViewController];
        controller.moc = self.moc;
        NSLog(@"Passed moc to SettingsViewController");

    } else if ([[segue identifier] isEqualToString: NAVIGATE_TO_PRE_QUIZ_SEGUE]) {
        PreQuizViewController *controller = [ segue destinationViewController];
        controller.moc = self.moc;
        controller.quiz = (Quiz*) sender;
        NSLog(@"Passed moc to PreQuizViewController");
    }
}


#pragma - NSFetchedResultsController

-(NSFetchedResultsController *)fetchResultsController {
    NSLog(@"Fetched results controller requested");
    if (_fetchResultsController != nil) {
        return _fetchResultsController;
    }

    // Create fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Quiz" inManagedObjectContext:self.moc];
    [fetchRequest setEntity:entity];

    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];


    // Remove this line
    fetchRequest.returnsObjectsAsFaults = NO;
    
    _fetchResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                  managedObjectContext:self.moc
                                                                    sectionNameKeyPath:@"section"
                                                                             cacheName:nil];
    
    _fetchResultsController.delegate = self;
    
    NSError *error = nil;
    NSArray *result = [self.moc executeFetchRequest: fetchRequest
                                              error: &error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
        NSLog(@"%@", result);
    }
    

    return _fetchResultsController;
}

#pragma alerts
- (void) showFirstRunDialog{
    if (self.isFirstRun) {
        NSDate *today = [NSDate date];
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *dateComponents = [gregorian components:(NSCalendarUnitHour  | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:today];
        NSInteger hour = [dateComponents hour];
        
        NSString *title;
        if (hour >= 4 && hour <= 11) {
            title = @"おはよう！";
        } else if (hour >11 && hour < 17) {
            title = @"こんにちは！";
        } else if (hour >= 17 || hour < 4) {
            title = @"こんばんは！";
        }
        
        UIAlertController *alertController = [ AlertControllerFactory createOkAlertWithTitle:title andMessage:@"Insert description here!"];
        [ self presentViewController:alertController animated:YES completion:nil];
    }
}

-(void) controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

-(void) controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}


@end
