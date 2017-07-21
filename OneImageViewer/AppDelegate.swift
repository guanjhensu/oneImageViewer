//
//  AppDelegate.swift
//  OneImageViewer
//
//  Created by 蘇冠禎 on 2017/7/21.
//  Copyright © 2017年 蘇冠禎. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let themeColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window?.tintColor = themeColor
        
        return true
    }
}

