//
//  HelloWorldAppDelegate.h
//  HelloWorld2
//
//  Created by Matthew J Morrison on 9/28/13.
//  Copyright (c) 2013 Matthew J Morrison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloWorldAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@end
