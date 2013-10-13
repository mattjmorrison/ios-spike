//
//  HelloWorldViewController.m
//  HelloWorld2
//
//  Created by Matthew J Morrison on 9/28/13.
//  Copyright (c) 2013 Matthew J Morrison. All rights reserved.
//

#import "HelloWorldViewController.h"
#import "SecondViewController.h"
#import "MyAtApiClient.h"


@interface HelloWorldViewController()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)changeGreeting:(id)sender;
- (IBAction)Dummy:(id)sender;
@property (weak, nonatomic) NSMutableData *receivedData;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation HelloWorldViewController
@synthesize receivedData, spinner;

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
    [spinner startAnimating];
    MyAtApiClient *client = [[MyAtApiClient alloc] init];
    [client getClasses: ^(NSString *data){
        [spinner stopAnimating];
        self.label.text = data;
    }];
    self.textField.text = @"";
}

- (IBAction)Dummy:(id)sender {
}


@end
