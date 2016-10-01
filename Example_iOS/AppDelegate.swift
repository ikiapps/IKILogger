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

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool
    {
        ikiLogger_useColor = true
        return true;
    }
}
