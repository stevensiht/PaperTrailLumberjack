//
//  RMSyslogFormatter.h
//  Pods
//
//  Created by Malayil Philip George on 5/7/14.
//  Copyright (c) 2016 Rogue Monkey Technologies & Systems Private Limited. All
//  rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "RMSyslogFormats.h"

/**
 Formats messages in the form of a syslog message.
    The syslog format (RFC3164) is defined as follows -
    \<xx\>timestamp machineName programName: message.
    xx is a log level that depicts the criticality of the error.
    timestamp - Time at which log was generated. Ex. Oct 11 22:14:15.
    machineName - typically hostname. We use 'vendorId' on iOS.
    programName - program or component generating log. CFBundleDisplayName
 (stripped of whitespace) is used
    message - is the message to be logged.
 */
@interface RMSyslogFormatter : NSObject <DDLogFormatter>

/**
 Specifies which RFC to follow for the syslog message format. We default to RFC 3164, so, as not to make a breaking change in newer versions of PapertrailLumberjack.
 */
@property (nonatomic, assign) RMSyslogRFCType syslogRFCType;

@end
