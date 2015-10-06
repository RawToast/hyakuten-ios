//
//  AlertControllerFactory.
//
//  Simple UIAlert generator.
//
//  Created by William Heng on 25/09/2015.
//
#import "AlertControllerFactory.h"

@implementation AlertControllerFactory

+(UIAlertController *)createOkAlertWithMessage: (NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    // Dismiss block
    void (^dismiss)(UIAlertAction *action) = ^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    };
    
    [ self addOKActionToAlert: alert withHandler: dismiss];
    return alert;
}

+(UIAlertController *)createOkAlertWithTitle: (NSString *)title andMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    // Dismiss block
    void (^dismiss)(UIAlertAction *action) = ^(UIAlertAction *action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    };
    
    [ self addOKActionToAlert: alert withHandler: dismiss];
    return alert;
}

+ (void) addOKActionToAlert: (UIAlertController *) alert withHandler:(void (^ __nullable)(UIAlertAction *action)) actionHandler {
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:actionHandler];
    [ alert addAction:okAction];
}

@end
