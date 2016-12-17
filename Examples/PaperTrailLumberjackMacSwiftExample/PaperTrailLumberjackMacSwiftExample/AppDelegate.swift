//
//  AppDelegate.swift
//  PaperTrailLumberjackMacSwiftExample
//
//  Created by George Malayil Philip on 09/02/16.
//  Copyright © 2016 Rogue Monkey Technologies And Systems Private Limited. All rights reserved.
//

import Cocoa
import PaperTrailLumberjack
import CocoaLumberjack

let ddLogLevel = DDLogLevel.verbose;

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func log(_ message: String) {
        DDLogVerbose("Verbose \(message)")
        DDLogInfo("Info \(message)")
        DDLogDebug("Debug \(message)")
        DDLogWarn("Warn \(message)")
        DDLogError("Error \(message)")
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let paperTrailLogger = RMPaperTrailLogger.sharedInstance()!
        paperTrailLogger.host = "logs.papertrailapp.com"
        paperTrailLogger.port = -1
        
        DDLog.add(paperTrailLogger)
        
        log("Default Values")
        
        paperTrailLogger.machineName = "Custom Machine Name"
        paperTrailLogger.programName = "Custom Program Name"
        
        log("Overriden Values")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

