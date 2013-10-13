//
//  MyAtApiClient.m
//  HelloWorld2
//
//  Created by Matthew J Morrison on 10/12/13.
//  Copyright (c) 2013 Matthew J Morrison. All rights reserved.
//

#import "MyAtApiClient.h"
#import "MyAtApi.h"

@implementation MyAtApiClient

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

- (void) getClasses: (void (^)(NSString *))callback {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"LoginTokenInfo3"];
    NSString *fileContents = [NSString stringWithContentsOfFile:appFile
                                                       encoding:NSUTF8StringEncoding error:nil];

    if ([fileContents length] == 0){

        NSMutableURLRequest *request = [self buildRequest];
        MyAtApi *api = [[MyAtApi alloc] initWithCallback:^(NSString *data){
            [data writeToFile:appFile atomically: YES];
            callback(data);
        }];
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:api];
        if (conn != nil) {
            NSLog(@"Error Creating Connection");
        }
    }
    else {
        callback(fileContents);
        NSLog(@"Already Got it: %@", fileContents);
    }
}

@end
