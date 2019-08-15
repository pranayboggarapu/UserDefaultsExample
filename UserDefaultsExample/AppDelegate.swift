//
//  AppDelegate.swift
//  UserDefaultsExample
//
//  Created by Pranay Boggarapu on 8/14/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if UserDefaults.standard.bool(forKey: "alreadyLaunched") {
            print("Not a first app launch")
        } else {
            print("first app launch")
            UserDefaults.standard.set(true, forKey: "alreadyLaunched")
            UserDefaults.standard.set(false, forKey: "isMidNightSavingOn")
        }
        
        return true
    }

}

