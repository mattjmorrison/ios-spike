//
//  MyAtApi.m
//  HelloWorld2
//
//  Created by Matthew J Morrison on 10/12/13.
//  Copyright (c) 2013 Matthew J Morrison. All rights reserved.
//

#import "MyAtApi.h"

@implementation MyAtApi

- (MyAtApi *) initWithCallback: (void (^)(NSString *))callback {
    self = [super init];
    self.callback = callback;
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
    self.callback(result);
}


@end
