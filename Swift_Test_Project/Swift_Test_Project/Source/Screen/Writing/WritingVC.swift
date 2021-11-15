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
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    private lazy var tableView = UITableView().then{
        $0.allowsSelection = false
        $0.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        $0.registerReusableCell(PhotoTVC.self)
        $0.registerReusableCell(TextFieldTVC.self)
        $0.registerReusableCell(TagTVC.self)
        $0.registerReusableCell(TextViewTVC.self)
    }
    
    private let wordButton = UIButton().then {
        $0.setTitle("자주 쓰는 문구", for: .normal)
        $0.setImage(Image.frequentlyIcon, for: .normal)
    }
    
    private let townButton = UIButton().then {
        $0.setTitle("보여줄 동네 설정", for: .normal)
        $0.setImage(Image.neighborSettingIcon, for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegation()
        setLayouts()
        setToolbar()
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        
    }
}

extension WritingVC {
    private func setToolbar() {
        navigationController?.isToolbarHidden = false
        navigationController?.toolbar.barTintColor = .white
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        fixedSpace.width = 10
        setToolbarItems([makeToolBarButtonItem(with: wordButton), fixedSpace, makeToolBarButtonItem(with: townButton), flexibleSpace], animated: true)
    }
    private func setDelegation() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func makeToolBarButtonItem(with button: UIButton) -> UIBarButtonItem {
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        button.setTitleColor(Color.daangnBlack1, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        
        let spacing: CGFloat = 6
        button.contentEdgeInsets =  UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
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

extension WritingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 109
        case 1, 2, 3:
            return 64
        case 4, 5:
            return 102
        case 6:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
    
}

extension WritingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: PhotoTVC = tableView.dequeueReusableCell(indexPath: indexPath)
            return cell
        case 1:
            let cell: TextFieldTVC = tableView.dequeueReusableCell(indexPath: indexPath)
            cell.type = .plain
            cell.setPlaceholder(with: "글 제목")
            return cell
        case 2:
            let cell = UITableViewCell()
            cell.textLabel?.text = "카테고리 선택"
            cell.textLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
            cell.textLabel?.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().inset(16)
            }
            
            let arrowImageView = UIImageView().then {
                $0.image = UIImage(systemName: "chevron.right")
                $0.contentMode = .scaleAspectFit
                $0.tintColor = .black
            }
            cell.contentView.addSubviews(arrowImageView)
            arrowImageView.snp.makeConstraints {
                $0.height.equalTo(16)
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview().inset(16)
            }
            return cell
        case 3:
            let cell: TextFieldTVC = tableView.dequeueReusableCell(indexPath: indexPath)
            cell.type = .button
            cell.setPlaceholder(with: "₩ 가격")
            return cell
        case 4:
            let cell: TagTVC = tableView.dequeueReusableCell(indexPath: indexPath)
            cell.makeTagButtons(with: "중고", "미개봉", "상태 양호", "하자 약간")
            cell.type = .title
            return cell
            
        case 5:
            let cell: TagTVC = tableView.dequeueReusableCell(indexPath: indexPath)
            cell.makeTagButtons(with: "대면", "택배")
            cell.type = .titleWithSubtitle
            return cell
        case 6:
            let cell: TextViewTVC = tableView.dequeueReusableCell(indexPath: indexPath)
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// 사이즈 동적 조절 개 멋져..
extension WritingVC: TableViewCellDelegate {
    func updateTextViewHeight(_ cell: TextViewTVC , _ textView: UITextView) {
        let size = textView.bounds.size
            let newSize = tableView.sizeThatFits(CGSize(width: size.width,
                                                        height: CGFloat.greatestFiniteMagnitude))
            if size.height != newSize.height {
                UIView.setAnimationsEnabled(false)
                tableView.beginUpdates()
                tableView.endUpdates()
                UIView.setAnimationsEnabled(true)
            }
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
