# IKILogger

Colorful, detailed logging output for Swift with support for Crashlytics logging and log message dates, for context over time.

Logging is prevented from going to STDOUT, for efficiency and cleanliness.

Output can be supressed using a date cutoff, for improving focus.

A prefix is added to messages and this can be filtered on, for eliminating Xcode 8 GM spam.

Written in Swift 2.3 and compatible with Xcode 7 and 8.

## Installation

There are two convenient ways of using this module.

1.	Installed as a Pod.
2.	Installed as a source file.

For (1), it is recommended that the following import be added to your bridging header.

	@import IKILogger;

This eliminates the need to import the module into every source file. The public functions can be then accessed in a global manner.

## Usage Examples

	dLogRed("ERROR: \(error)", date: "2016-Sep-13")
	dLogGreen("Everything is fine.", date: "2016-Sep-13")

---

Further documentation TBW.
