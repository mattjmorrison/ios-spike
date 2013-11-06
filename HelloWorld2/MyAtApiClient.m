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

- (NSMutableURLRequest *) buildRequest: (NSString *)username password:(NSString *) password {
    NSLog(@"buildRequest");
    NSString *url = @"http://test.myattendancetracker.com/api/login";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL: [NSURL URLWithString: url]];
    [request setHTTPMethod: @"POST"];

    NSString *postString = [NSString stringWithFormat:@"api=auth&email_address=%@&password=%@", username, password];
    [request setHTTPBody: [postString dataUsingEncoding: NSUTF8StringEncoding]];
    return request;
}

- (void) getClasses: (NSString *)username password:(NSString *)password callback: (void (^)(NSString *))callback {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"LogixnTokenInfo5"];
   
    
    NSString *fileContents = [NSString stringWithContentsOfFile:appFile
                                                       encoding:NSUTF8StringEncoding error:nil];

    if ([fileContents length] == 0){

        NSMutableURLRequest *request = [self buildRequest: username password:password];
        
        MyAtApi *api = [[MyAtApi alloc] initWithCallback:^(NSString *data){
            NSError *e = nil;
            NSData* tmpData = [data dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *jsonObject = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:tmpData options: NSJSONReadingAllowFragments error: &e];
            
            NSLog([jsonObject objectForKey:@"token"]);

            NSString *token = (NSString *)[jsonObject objectForKey:@"token"];
            [token writeToFile:appFile atomically: YES];
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
