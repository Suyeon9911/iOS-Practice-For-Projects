//
//  PhotoCVC.swift
//  Swift_Test_Project
//
//  Created by 김수연 on 2021/11/15.
//

import UIKit

final class PhotoCVC: UICollectionViewCell {
    
    private let vStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 5
        $0.distribution = .fillEqually
    }
    
    private let imageView = UIImageView().then {
        $0.image = Image.photoIcon
        $0.contentMode = .scaleAspectFit
    }
    
    private let label = UILabel().then {
        $0.text = "0/10"
        $0.textColor = Color.daangnGray3
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        round()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotoCVC {
    private func round() {
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.borderColor = Color.daangnGray3.cgColor
        clipsToBounds = true
    }
}

extension PhotoCVC {
    private func setLayouts() {
        setViewHierarchies()
        setConstraints()
    }
    
    private func setViewHierarchies() {
        contentView.addSubviews(vStackView)
        vStackView.addArrangedSubview(imageView)
        vStackView.addArrangedSubview(label)
    }

    private func setConstraints() {
        vStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
