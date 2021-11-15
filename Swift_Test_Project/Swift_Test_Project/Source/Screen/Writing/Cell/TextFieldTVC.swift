//
//  TextFieldTVC.swift
//  Swift_Test_Project
//
//  Created by 김수연 on 2021/11/16.
//

import UIKit

enum TextFieldCellType {
    case plain
    case button
}

final class TextFieldTVC: UITableViewCell {
    public var type: TextFieldCellType = .plain{
        didSet {
            setLayouts()
        }
    }
    
    private let textField = UITextField().then {
        $0.borderStyle = .none
    }
    
    private lazy var checkButton = UIButton(type: .custom).then {
        $0.titleLabel?.font = .systemFont(ofSize: 12)
        $0.setTitle("가격 제안받기", for: .normal)
        
        $0.setTitleColor(Color.daangnBlack1, for: .selected)
        $0.setTitleColor(Color.daangnGray4, for: .normal)
        
        $0.setImage(Image.checkMarkFilledIcon, for: .selected)
        $0.setImage(Image.checkMarkEmptyIcon, for: .normal)
        
        let spacing: CGFloat = 3
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
        
        $0.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        $0.isSelected = true
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextFieldTVC {
    public func setPlaceholder(with text: String) {
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: [.foregroundColor: Color.daangnGray5.cgColor, .font: UIFont.systemFont(ofSize: 15, weight: .regular)])
    }
}

extension TextFieldTVC {
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        checkButton.isSelected.toggle()
    }
}

extension TextFieldTVC {
    private func setLayouts() {
        setViewHierarchies()
        setConstraints()
    }
    
    private func setViewHierarchies() {
        switch type {
        case .plain:
            contentView.addSubviews(textField)
        case .button:
            contentView.addSubviews(textField, checkButton)
        }
    }
    
    private func setConstraints() {
        switch type {
        case .plain:
            textField.snp.makeConstraints {
                $0.leading.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(48)
                $0.centerY.equalToSuperview()
            }
        case .button:
            textField.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
                $0.trailing.equalTo(checkButton.snp.leading).inset(16)
                $0.height.equalTo(48)
                $0.centerY.equalToSuperview()
            }
            
            checkButton.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(16)
                $0.width.equalTo(100)
                $0.height.equalTo(25)
                $0.centerY.equalTo(textField.snp.centerY)
            }
            
        }
    }
}
