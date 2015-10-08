//
//  MainTableViewController.h
//  hyakuten
//
//  Created by James Morris on 29/09/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MainTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

extern NSString *const NAVIGATE_TO_QUIZ_SEGUE;

@property (nonatomic, strong) NSManagedObjectContext *moc;
@property (nonatomic, strong) NSFetchedResultsController *fetchResultsController;
@property BOOL isFirstRun;

@end
