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
    
    // tabBar item 선택 시 애니메이션 적용
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let itemView = item.value(forKey: "view") as? UIView else { return }
        let itemAnimator = UIViewPropertyAnimator(duration: 0.1, dampingRatio: 0.5) {
            itemView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }
        itemAnimator.addAnimations({itemView.transform = .identity}, delayFactor: 0.5)
        itemAnimator.startAnimation()
    }
}

extension TabBarController {
    private func makeTabBarItems() {
        let homeView = HomeVC()
        homeView.tabBarItem = UITabBarItem(
            title: "홈", image: Image.homeIcon , selectedImage: Image.homeIcon
        )
        
        let myTownView = HomeVC()
        myTownView.tabBarItem = UITabBarItem(
            title: "내 근처", image: Image.locationIcon, selectedImage: Image.locationIcon
        )
        
        let chattingView = HomeVC()
        chattingView.tabBarItem = UITabBarItem(
            title: "채팅", image: Image.chatsIcon , selectedImage: Image.chatsIcon
        )
        
        let myPageView = HomeVC()
        myPageView.tabBarItem = UITabBarItem(
            title: "나의 당근", image: Image.myPageIcon , selectedImage: Image.myPageIcon
        )
        
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
        UITabBar.appearance().layer.borderColor = Color.daangnGray1.cgColor
        UITabBar.appearance().layer.borderWidth = 0.3
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 10, weight: .regular)],for: .normal)
        UITabBar.appearance().tintColor = Color.daangnBlack1
        UITabBar.appearance().unselectedItemTintColor = Color.daangnBlack1
    }
}
