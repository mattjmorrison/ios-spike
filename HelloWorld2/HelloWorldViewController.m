//
//  HelloWorldViewController.m
//  HelloWorld2
//
//  Created by Matthew J Morrison on 9/28/13.
//  Copyright (c) 2013 Matthew J Morrison. All rights reserved.
//

#import "HelloWorldViewController.h"
#import "SecondViewController.h"

@interface HelloWorldViewController()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)changeGreeting:(id)sender;
- (IBAction)Dummy:(id)sender;

@end

@implementation HelloWorldViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SecondViewController *vc = [segue destinationViewController];
    vc.message = self.textField.text;
}

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

- (IBAction)Dummy:(id)sender {
    NSLog(@"In DUmmy");
}

- (NSString *) getClasses {
    NSString *url = @"http://test.myattendancetracker.com/api/login";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL: [NSURL URLWithString: url]];
    [request setHTTPMethod: @"POST"];
    
    NSString *postString = @"api=auth&email_address=nicolen.morrison@gmail.com&password=sugieballs";
    [request setHTTPBody: [postString dataUsingEncoding: NSUTF8StringEncoding]];
    NSHTTPURLResponse *urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest: request returningResponse: &urlResponse error: &error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    
    if ([urlResponse statusCode] == 200) {
        return result;
    }
    return @"error";
}
@end
