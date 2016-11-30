# IKILogger

Colorful, detailed logging output for Swift with support for Crashlytics logging and log message dates, for context over time.

Logging is prevented from going to STDOUT, for efficiency and cleanliness.

Output can be supressed using a date cutoff, for improving focus.

A prefix is added to messages and this can be filtered on, for eliminating Xcode 8 spam.

## Versions

Version 1.x.x is for Swift 2.3 and compatible with Xcode 7 and 8.

Version 2.x.x is for Swift 3 and Xcode 8.

## Installation

There are two convenient ways of using this module.

1.	Installed as a Pod.
2.	Installed as a source file.

For (1), it is recommended that the following import be added to your bridging header.

	@import IKILogger;

This eliminates the need to import the module into every source file. The public functions can be then accessed in a global manner.

## Usage Examples

This code

    class ViewController: UIViewController
    {
        override func viewDidLoad() {
            super.viewDidLoad()
    
            dLogGray("Hello", date: "2016-Sep-22")
            dLogRed("World", date: "2016-Sep-22")
            dLog("", date: "2016-Sep-22")
    
            dLogOrange("A summer river being crossed", date: "2016-Sep-22")
            dLogYellow("how pleasing", date: "2016-Sep-22")
            dLogPurple("with sandals in my hands!", date: "2016-Sep-22")
            dLog("", date: "2016-Sep-22")
    
            dLogGreen("An old silent pond...", date: "2016-Sep-22")
            dLogBlue("A frog jumps into the pond,", date: "2016-Sep-22")
            dLogPurple("splash! Silence again.", date: "2016-Sep-22")
            dLog("", date: "2016-Sep-22")
        }
    }

gives the following output in the console log.

    ikiApps ❔ -[ViewController.swift:16] viewDidLoad() - Hello
	ikiApps ‼️ -[ViewController.swift:17] viewDidLoad() - World
	ikiApps ⬜️ -[ViewController.swift:18] viewDidLoad() - 
	ikiApps ✴️ -[ViewController.swift:20] viewDidLoad() - A summer river being crossed
	ikiApps 💛 -[ViewController.swift:21] viewDidLoad() - how pleasing
	ikiApps 💜 -[ViewController.swift:22] viewDidLoad() - with sandals in my hands!
	ikiApps ⬜️ -[ViewController.swift:23] viewDidLoad() - 
	ikiApps ✅ -[ViewController.swift:25] viewDidLoad() - An old silent pond...
	ikiApps 💙 -[ViewController.swift:26] viewDidLoad() - A frog jumps into the pond,
	ikiApps 💜 -[ViewController.swift:27] viewDidLoad() - splash! Silence again.
	ikiApps ⬜️ -[ViewController.swift:28] viewDidLoad() - 

---

Further documentation TBW.
