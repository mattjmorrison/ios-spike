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
@property (weak, nonatomic) NSMutableData *receivedData;

@end

@implementation HelloWorldViewController
@synthesize receivedData;

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
    [self getClasses];
    self.textField.text = @"";
}

- (IBAction)Dummy:(id)sender {
}

- (NSMutableURLRequest *) buildRequest {
    NSLog(@"buildRequest");
    NSString *url = @"http://test.myattendancetracker.com/api/login";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL: [NSURL URLWithString: url]];
    [request setHTTPMethod: @"POST"];
    
    NSString *postString = @"api=auth&email_address=nicolen.morrison@gmail.com&password=sugieballs";
    [request setHTTPBody: [postString dataUsingEncoding: NSUTF8StringEncoding]];
    return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    self.label.text = result;
}

- (void) getClasses {
    NSMutableURLRequest *request = [self buildRequest];

    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (theConnection) {
        receivedData = nil;
    }
}
@end
