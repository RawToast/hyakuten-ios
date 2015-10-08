//
//  PreQuizViewController.h
//  hyakuten
//
//  Created by James Morris on 08/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "Quiz.h"

@interface PreQuizViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *moc;
@property (weak, nonatomic) Quiz *quiz;

@end
