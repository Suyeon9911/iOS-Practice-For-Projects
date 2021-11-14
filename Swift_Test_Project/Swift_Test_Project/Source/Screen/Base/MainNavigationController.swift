//
//  MainViewController.swift
//  Swift_Test_Project
//
//  Created by 김수연 on 2021/11/14.
//

import UIKit

import Then

final class MainNavigationController: BaseNavigationController {
    
    //Mark: - Properties
    private lazy var logoItem = UIBarButtonItem().then {
        let label = UILabel()
        label.text = "지역명"
        label.font = .systemFont(ofSize: 19, weight: .bold)
        $0.customView = label
    }
    
    private lazy var downArrowButtonItem = UIBarButtonItem().then {
        $0.customView = makeBarButtonItem(image: Image.downArrowIcon, tag: 0)
    }
    
    private lazy var searchButtonItem = UIBarButtonItem().then {
        $0.customView = makeBarButtonItem(image: Image.searchIcon, tag: 1)
    }
    
    private lazy var categoryButtonItem = UIBarButtonItem().then {
        $0.customView = makeBarButtonItem(image: Image.categoryIcon, tag: 2)
    }
    
    private lazy var alarmButtonItem = UIBarButtonItem().then {
        $0.customView = makeBarButtonItem(image: Image.alarmIcon, tag: 3)
    }
    
    //Mark: - Life Cycle
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        initNavigationItem(navigationItem: rootViewController.navigationItem)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension MainNavigationController {
    private func initNavigationItem(navigationItem: UINavigationItem?) {
        let spacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacing.width = 6
        navigationItem?.leftBarButtonItems = [logoItem, spacing, downArrowButtonItem]
        navigationItem?.rightBarButtonItems = [alarmButtonItem, spacing, categoryButtonItem, spacing, searchButtonItem ]
        
        
    }
    
    //Mark: - make BarButtonItem
    private func makeBarButtonItem(image: UIImage, tag: Int) -> UIButton {
        let button = UIButton(type: .custom)
        button.tag = tag
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        return button
    }
}

//Mark: - @objc
extension MainNavigationController {
    @objc
    private func buttonDidTapped(_ sender: UIButton) {}
}
