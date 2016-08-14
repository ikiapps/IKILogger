//
//  ViewController.swift
//  Example_iOS
//
//  Created by Daniel on 8/13/16.
//
//

import UIKit
import IKILogger_iOS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        dLog("Hello from IKILogger!", date: "2016-Aug-13")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

