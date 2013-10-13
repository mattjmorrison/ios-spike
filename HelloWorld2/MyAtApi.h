//
//  MyAtApi.h
//  HelloWorld2
//
//  Created by Matthew J Morrison on 10/12/13.
//  Copyright (c) 2013 Matthew J Morrison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAtApi : NSObject

- (MyAtApi *) initWithCallback: (void (^)(NSString *))callback;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

@property(copy) void (^callback)(NSString *);

@end
