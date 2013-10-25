//
//  Auth.h
//  HelloWorld2
//
//  Created by Matthew J Morrison on 10/22/13.
//  Copyright (c) 2013 Matthew J Morrison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Auth : NSManagedObject

@property (nonatomic, retain) NSString * token;
@property (nonatomic, retain) NSString * user_id;

@end
