//
//  RMAppDelegate.m
//  PaperTrailLumberjackiOSExample
//
//  Created by Malayil Philip George on 5/8/14.
//  Copyright (c) 2014 Rogue Monkey Technologies & Systems Private Limited. All rights reserved.
//

#import "RMAppDelegate.h"
#import <PaperTrailLumberjack/PaperTrailLumberjack.h>

static const int ddLogLevel = DDLogLevelVerbose;

@implementation RMAppDelegate

-(void) log:(NSString* ) message
{
    DDLogVerbose(@"Verbose %@", message);
    DDLogInfo(@"Info %@", message);
    DDLogDebug(@"Debug %@", message);
    DDLogWarn(@"Warn %@", message);
    DDLogError(@"Error %@", message);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:[[UIViewController alloc] init]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    RMPaperTrailLogger *paperTrailLogger = [RMPaperTrailLogger sharedInstance];
    paperTrailLogger.host = @"logs.papertrailapp.com"; //Replace with your log destination URL
    paperTrailLogger.port = -1; //Replace with your port
    paperTrailLogger.useTcp = NO;
    //    paperTrailLogger.useTLS = NO;
    
    [DDLog addLogger:paperTrailLogger];
    
    DDLogVerbose(@"New logs");
    
    [self log:@"Default Values"];

    paperTrailLogger.machineName = @"Custom iOS Logging Machine Name";
    paperTrailLogger.programName = @"iOS Logging Program";
    
    [self log:@"Overriden Values"];
    
    paperTrailLogger.machineName = @"M";
    paperTrailLogger.programName = @"P";
    
    [self log:@"Empty Values"];
    
    paperTrailLogger.machineName = nil;
    paperTrailLogger.programName = nil;
    
    [self log:@"Reset to Default Values"];

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
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
