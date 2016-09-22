//
//  AppDelegate.swift
//  Example_iOS
//
//  Created by Daniel on 8/13/16.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder,
                   UIApplicationDelegate
{
    var window: UIWindow?

    func application(application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool
    {
        ikiLogger_useColor = true
        return true;
    }
}
