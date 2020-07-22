//
//  AppDelegate.swift
//  TableView
//
//  Created by Jitendra Kumar on 21/07/20.
//  Copyright © 2020 Jitendra Kumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // add navigation controller to window and add ViewController as root view controller to navigation controller
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainVC = ViewController()
        let navigationController = UINavigationController(rootViewController: mainVC)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true

    }
}

