//
//  WritingVC.swift
//  Swift_Test_Project
//
//  Created by 김수연 on 2021/11/14.
//

import UIKit

import SnapKit
import Then

final class WritingVC: UIViewController {
    
    private lazy var closeButton = UIButton().then{
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.contentMode = .scaleToFill
        $0.imageEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }

    private lazy var doneButton = UIButton().then{
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(Color.daangnOrange, for: .normal)
        $0.setTitleColor(Color.daangnGray3, for: .disabled)
    }
    
    private let tableView = UITableView().then {
        // 셀 선택
        $0.allowsSelection = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
}

extension WritingVC {
    private func setNavigationBar() {
        title = "중고거래 글쓰기"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 19, weight: .regular)]
        navigationItem.leftBarButtonItem = makeBarButtonItem(with: closeButton)
        navigationItem.rightBarButtonItem = makeBarButtonItem(with: doneButton)
    }
    
    private func makeBarButtonItem(with button: UIButton) -> UIBarButtonItem {
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
}

extension WritingVC {
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        switch sender {
        case closeButton:
            dismiss(animated: true, completion: nil)
        case doneButton:
            // todo: 통신 구현시 disabled 구현
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
}
