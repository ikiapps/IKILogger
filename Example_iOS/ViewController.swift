//
//  ViewController.swift
//  Example_iOS
//
//  Created by Daniel on 8/13/16.
//
//

import UIKit

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
