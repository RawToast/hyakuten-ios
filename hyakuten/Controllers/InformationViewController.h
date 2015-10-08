//
//  InformationView.h
//  hyakuten
//
//  Created by James Morris on 07/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Quiz.h"
#import "YTPlayerView.h"

@interface InformationViewController : UIViewController
@property (weak, nonatomic) IBOutlet YTPlayerView *playerView;
@property (strong, nonatomic) NSManagedObjectContext *moc;
@property (strong, nonatomic) Quiz *quiz;

@end
