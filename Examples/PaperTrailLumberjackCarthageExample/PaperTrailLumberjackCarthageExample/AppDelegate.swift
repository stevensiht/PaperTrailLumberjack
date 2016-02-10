//
//  AppDelegate.swift
//  PaperTrailLumberjackCarthageExample
//
//  Created by George Malayil Philip on 10/02/16.
//  Copyright © 2016 Rogue Monkey Technologies And Systems Private Limited. All rights reserved.
//

import Cocoa
import CocoaLumberjackSwift
import PaperTrailLumberjack


let ddLogLevel = DDLogLevel.Verbose;

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func log(message: String) {
        DDLogVerbose("Verbose \(message)")
        DDLogInfo("Info \(message)")
        DDLogDebug("Debug \(message)")
        DDLogWarn("Warn \(message)")
        DDLogError("Error \(message)")
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        let paperTrailLogger = RMPaperTrailLogger.sharedInstance() as RMPaperTrailLogger!
        paperTrailLogger.host = "logs.papertrailapp.com"
        paperTrailLogger.port = -1
        
        DDLog.addLogger(paperTrailLogger)
        
        log("Default Values")
        
        paperTrailLogger.machineName = "Custom Machine Name"
        paperTrailLogger.programName = "Custom Program Name"
        
        log("Overriden Values")
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    
}

