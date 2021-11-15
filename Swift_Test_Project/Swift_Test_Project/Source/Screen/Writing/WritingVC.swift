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
    
    private let tableView = UITableView().then{
        $0.allowsSelection = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension WritingVC {
    private func setDelegation() {
        tableView.delegate = self
        tableView.dataSource = self
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

extension WritingVC: UITableViewDelegate {
    
}

extension WritingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension WritingVC {
    func setLayouts() {
        setViewHierarchies()
        setConstraints()
    }
    
    func setViewHierarchies() {
        view.addSubviews(tableView)
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
