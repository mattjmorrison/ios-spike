//
//  HelloWorldViewController.m
//  HelloWorld2
//
//  Created by Matthew J Morrison on 9/28/13.
//  Copyright (c) 2013 Matthew J Morrison. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)changeGreeting:(id)sender;

@end

@implementation HelloWorldViewController

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    
    if (theTextField == self.textField){
        [theTextField resignFirstResponder];
    }
    
    return YES;
}

- (IBAction)changeGreeting:(id)sender {
    self.label.text = [self getClasses];
    self.textField.text = @"";
}

- (NSString *) getClasses {
    NSString *url = @"http://test.myattendancetracker.com/api/class";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: url]];
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    if ([urlResponse statusCode] == 200) {
        return result;
    }
    return @"error";
}
@end
