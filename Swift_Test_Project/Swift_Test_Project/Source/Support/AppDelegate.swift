//
//  AppDelegate.swift
//  Swift_Test_Project
//
//  Created by 김수연 on 2021/11/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = BaseNavigationController(rootViewController: WritingVC())
        window?.backgroundColor = Color.daangnWhite
        window?.makeKeyAndVisible()
        return true
    }
}
