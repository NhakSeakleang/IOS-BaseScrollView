//
//  AppDelegate.swift
//  Base Scroll Controller
//
//  Created by GIS on 12/30/19.
//  Copyright © 2019 GIS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: BaseController())
        window?.makeKeyAndVisible()
        
        return true
    }

}

