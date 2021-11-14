//
//  TabBarController.swift
//  Swift_Test_Project
//
//  Created by 김수연 on 2021/11/14.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeTabBarItems()
        setTabBarAppearance()
    }
}

extension TabBarController {
    private func makeTabBarItems() {
        let homeView = HomeVC()
        homeView.tabBarItem = UITabBarItem()
        
        let myTownView = HomeVC()
        myTownView.tabBarItem = UITabBarItem()
        
        let chattingView = HomeVC()
        chattingView.tabBarItem = UITabBarItem()
        
        let myPageView = HomeVC()
        myPageView.tabBarItem = UITabBarItem()
        
        viewControllers = [
            homeView,
            myTownView,
            chattingView,
            myPageView
        ]
    }
    
    private func setTabBarAppearance() {
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().layer.borderWidth = 0.0
    }
}
