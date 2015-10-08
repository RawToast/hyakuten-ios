//
//  AlertControllerFactory.
//
//  Simple UIAlert generator.
//
//  Created by William Heng on 25/09/2015.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma clang diagnostic ignored "-Wnullability-completeness"

@interface AlertControllerFactory : NSObject

+ (UIAlertController *)createOkAlertWithMessage: (NSString *)message;
+ (UIAlertController *)createOkAlertWithTitle: (NSString *)title andMessage:(NSString *)message;
+ (void) addOKActionToAlert: (UIAlertController *) alert withHandler:(void (^ __nullable)(UIAlertAction *action)) actionHandler;
@end
