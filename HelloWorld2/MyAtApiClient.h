//
//  MyAtApiClient.h
//  HelloWorld2
//
//  Created by Matthew J Morrison on 10/12/13.
//  Copyright (c) 2013 Matthew J Morrison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAtApiClient : NSObject
- (void) getClasses: (void (^)(NSString *))callback;
@end
