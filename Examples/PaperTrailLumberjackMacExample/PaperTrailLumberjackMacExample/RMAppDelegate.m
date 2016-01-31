//
//  RMAppDelegate.m
//  PaperTrailLumberjackMacExample
//
//  Created by Malayil Philip George on 5/8/14.
//  Copyright (c) 2014 Rogue Monkey Technologies & Systems Private Limited. All rights reserved.
//

#import "RMAppDelegate.h"

#import <PaperTrailLumberjack/RMPaperTrailLumberjack.h>

const int ddLogLevel = DDLogLevelVerbose;

@implementation RMAppDelegate

-(void) log:(NSString* ) message
{
    DDLogVerbose(@"Verbose %@", message);
    DDLogInfo(@"Info %@", message);
    DDLogDebug(@"Debug %@", message);
    DDLogWarn(@"Warn %@", message);
    DDLogError(@"Error %@", message);
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    RMPaperTrailLogger *paperTrailLogger = [RMPaperTrailLogger sharedInstance];
    paperTrailLogger.host = @"logs.papertrailapp.com"; //Replace with your log destination URL
    paperTrailLogger.port = -1; //Replace with your port
//    paperTrailLogger.useTcp = NO;
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
}

@end
