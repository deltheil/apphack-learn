//
//  LNAppDelegate.m
//  Snippets
//
//  Created by Cédric Deltheil on 19/10/13.
//  Copyright (c) 2013 AppHACK. All rights reserved.
//

#import "LNAppDelegate.h"

#import "MainViewController.h"
#import "BoardingViewController.h"

// Winch main header
#import <Winch/Winch.h>

// ==========================================
// Winch demo datastore credentials
// ==========================================
#define WNC_DATASTORE_ID @"Id"
#define WNC_APP_SECRET   @"sEcReT"

@interface LNAppDelegate ()

@property (nonatomic, strong) BoardingViewController *boardingView;
@property (nonatomic, strong) UINavigationController *mainNav;

@end

@implementation LNAppDelegate {
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
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    MainViewController *mainView = [[MainViewController alloc] init];
    self.mainNav = [[UINavigationController alloc] initWithRootViewController:mainView];

    self.window.rootViewController = self.mainNav;
    [self.window makeKeyAndVisible];

    // Boarding
    self.boardingView = [[BoardingViewController alloc] init];

    [self.window.rootViewController addChildViewController:self.boardingView];
    [self.window addSubview:self.boardingView.view];
    [self.boardingView didMoveToParentViewController:self.window.rootViewController];

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