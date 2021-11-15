//
//  WritingVC.swift
//  Swift_Test_Project
//
//  Created by 김수연 on 2021/11/14.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
