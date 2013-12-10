//
//  AppDelegate.m
//  Snippets
//
//  Created by Cédric Deltheil on 19/10/13.
//  Copyright (c) 2013 Snippets. All rights reserved.
//

#import "AppDelegate.h"

// Winch main header
#import <Winch/Winch.h>

#import "TopicTableViewController.h"

// ==========================================
// Winch demo datastore credentials
// ==========================================
#define WNC_DATASTORE_ID @"ZCDFQ0KDSO"
#define WNC_APP_SECRET   @"1LPbPhLr5DiutD1Z"

@implementation AppDelegate {
    WNCDatabase *_database;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *path = [WNCDatabase cachesPathFor:@"store.db"];
    
    _database = [WNCDatabase databaseWithPath:path];
    
    NSError *error;
    if (![_database openWithID:WNC_DATASTORE_ID appSecret:WNC_APP_SECRET error:&error]) {
        NSLog(@"winch open error: %@", [error wnc_message]);
    }
    
    UINavigationController *navigationVC = (UINavigationController *) self.window.rootViewController;
    TopicTableViewController *topicVC = (TopicTableViewController *) navigationVC.topViewController;
    topicVC.database = _database;

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [_database close];
}

@end
