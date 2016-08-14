//
//  IKILogger.swift
//
//  version 1.0.0
//
//  The MIT License (MIT)
//  Copyright (c) 2016 ikiApps LLC.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
#if CRASHLYTICS
    import Crashlytics
#endif

/**
 This library provides DLog style debugging for Swift using color output support
 from the XcodeColors plugin. See https://github.com/robbiehanson/XcodeColors.

 Colored debugging logging enhances logs by adding an extra dimension of
 debugging data that can be quickly discerned without reading. This is especially
 useful for those that associate meanings to colors. In this library, the meaning
 of CRITICAL is assigned to the color red. This color value will always be logged
 and is, therefore, useful for printing NSError occurrences.

 Output is passed to Crashlytics logging. See
 https://docs.fabric.io/apple/crashlytics/enhanced-reports.html#custom-logs.

 Crashlytics will be used if -DCRASHLYTICS is set for the current build target.

 If Crashlytics is not in use, then output will only be shown when -DDEBUG is set
 in the Swift compiler flags under Build Settings for the Xcode target.

 Usage Examples:

 dLog("data \(data)", date: "2016-Jul-28");

 dLogYellow("", date: "2016-Jul-28")

 dLogRed("error \(error)", date: "2016-Jul-28");
 */

/// Flag to enable logging output through IKILogger.
public var ikiLogger_enabled = true

/// Cut off output that has a logging date before this date. The format of this string is "yyyy-MMM-dd".
public var ikiLogger_suppressBeforeDate = "2000-Jan-01"

/// Determine whether or not Crashlytics will be used for logging.
#if CRASHLYTICS
    public var ikiLogger_useCrashlytics = true
#else
    public var ikiLogger_useCrashlytics = false
#endif

/// Determine whether or not to use color output.
public var ikiLogger_useColor = false

let ESCAPE = "\u{001b}["
let RESET_FG = "\u{001b}[" + "fg;" // Clear any foreground color.
let RESET_BG = "\u{001b}[" + "bg;" // Clear any background color.
let RESET = "\u{001b}[" + ";"  // Clear any foreground or background color.

struct LogColor {
    static let critical = "bg220,100,100;" // Messages using this color will always be logged.
    static let important = "bg255,212,120;"
    static let highlighted = "bg255,252,120;"
    static let reviewed = "bg213,251,120;"
    static let valuable = "bg118,214,255;"
    static let toBeReviewed = "bg215,131,255;"
    static let notImportant = "bg192,192,192;"
    static let none = "fg0,34,98;"
}

public func dLog(message: String?, date: String? = nil, filename: String = #file, function: String = #function, line: Int = #line) {
    logMessageWithColor(LogColor.none, message: message, date: date, filename: filename, function: function, line: line)
}

public func dLogRed(message: String?, date: String? = nil, filename: String = #file, function: String = #function, line: Int = #line) {
    logMessageWithColor(LogColor.critical, message: message, date: date, filename: filename, function: function, line: line)
}

public func dLogOrange(message: String?, date: String? = nil, filename: String = #file, function: String = #function, line: Int = #line) {
    logMessageWithColor(LogColor.important, message: message, date: date, filename: filename, function: function, line: line)
}

public func dLogYellow(message: String?, date: String? = nil, filename: String = #file, function: String = #function, line: Int = #line) {
    logMessageWithColor(LogColor.highlighted, message: message, date: date, filename: filename, function: function, line: line)
}

public func dLogGreen(message: String?, date: String? = nil, filename: String = #file, function: String = #function, line: Int = #line) {
    logMessageWithColor(LogColor.reviewed, message: message, date: date, filename: filename, function: function, line: line)
}

public func dLogBlue(message: String?, date: String? = nil, filename: String = #file, function: String = #function, line: Int = #line) {
    logMessageWithColor(LogColor.valuable, message: message, date: date, filename: filename, function: function, line: line)
}

func dLogPurple(message: String?, date: String? = nil, filename: String = #file, function: String = #function, line: Int = #line) {
    logMessageWithColor(LogColor.toBeReviewed, message: message, date: date, filename: filename, function: function, line: line)
}

public func dLogGray(message: String?, date: String? = nil, filename: String = #file, function: String = #function, line: Int = #line) {
    logMessageWithColor(LogColor.notImportant, message: message, date: date, filename: filename, function: function, line: line)
}

#if VERBOSE_DEBUG
    // Verbose debugging has not been implemented yet.
#else
    func vLog(message: String, date: String? = nil) {}
    func vLogRed(message: String, date: String? = nil) {}
    func vLogOrange(message: String, date: String? = nil) {}
    func vLogYellow(message: String, date: String? = nil) {}
    func vLogGreen(message: String, date: String? = nil) {}
    func vLogBlue(message: String, date: String? = nil) {}
    func vLogPurple(message: String, date: String? = nil) {}
    func vLogGray(message: String, date: String? = nil) {}
#endif

// ------------------------------------------------------------
// MARK: - Private -
// ------------------------------------------------------------

/// Print a logging message using color output.
private func logMessageWithColor(color: String,
                                 message: String?,
                                 date: String?,
                                 filename: String,
                                 function: String,
                                 line: Int)
{
    guard let dateString = date where ikiLogger_enabled else {
        return;
    }

    if messageShouldBeLoggedBasedOnDate(dateString, colorString: color) {
        if let uwMessage = message as String? {
            #if CRASHLYTICS
                if ikiLogger_useCrashlytics {
                    if ikiLogger_useColor {
                        CLSNSLogv("\(ESCAPE)\(color)-[%@:%d] %@ - %@\(RESET)", getVaList([(filename as NSString).lastPathComponent, line, function, uwMessage]))
                    } else {
                        CLSNSLogv("-[%@:%d] %@ - %@", getVaList([(filename as NSString).lastPathComponent, line, function, uwMessage]))
                    }
                }
            #else
                if ikiLogger_useColor {
                    NSLog("\(ESCAPE)\(color)-[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(uwMessage)\(RESET)")
                } else {
                    NSLog("-[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(uwMessage)")
                }
            #endif
        }
    }
}

/// Decide if a date comparison should be ignored based on the logging color.
private func dateComparisonShouldBeIgnored(colorString: String) -> Bool
{
    var ignoreDateComparison = false

    // Ignore date comparisons if the color level is CRITICAL.
    if colorString == LogColor.critical {
        ignoreDateComparison = true
    }

    return ignoreDateComparison;
}

/// Log the message if the creation date for the message is after the suppression date and the color is not set for forced logging.
private func messageShouldBeLoggedBasedOnDate(dateString: String, colorString: String) -> Bool
{
    if dateComparisonShouldBeIgnored(colorString) { return true; }

    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MMM-dd"

    let newDate = formatter.dateFromString(dateString)
    var printMessage = false

    let beforeDate = formatter.dateFromString(ikiLogger_suppressBeforeDate)

    if let uwNewDate = newDate, uwBeforeDate = beforeDate {
        if uwNewDate.compare(uwBeforeDate) == NSComparisonResult.OrderedDescending {
            printMessage = true
        }
    }

    return printMessage;
}

