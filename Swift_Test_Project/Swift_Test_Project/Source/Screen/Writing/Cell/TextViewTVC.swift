//
//  TextViewTVC.swift
//  Swift_Test_Project
//
//  Created by 김수연 on 2021/11/16.
//

import UIKit

// Delegate가 나와버린다라... anyobject... height 업뎃 해주기 ??
protocol TableViewCellDelegate: AnyObject {
    func updateTextViewHeight(_ cell: TextViewTVC, _ textView: UITextView)
}

final class TextViewTVC: UITableViewCell {
    weak var delegate: TableViewCellDelegate?

    private let textView = UITextView().then {
        $0.isScrollEnabled = false
        $0.sizeToFit()
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.text = "게시글 내용을 작성해주세요. (가품 및 판매금지품목은\n게시가 제한될 수 있어요.)"
        $0.textColor = Color.daangnGray5
        $0.textContainerInset = UIEdgeInsets(top: 30, left: 16, bottom: 10, right: 16)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textView.delegate = self
        setLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// TextViewDelegate
extension TextViewTVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let delegate = delegate {
              delegate.updateTextViewHeight(self, textView)
        }
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == Color.daangnGray5 {
          textView.text = nil
            textView.textColor = Color.daangnBlack1
        }
      }

      func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
          textView.text = "게시글 내용을 작성해주세요. (가품 및 판매금지품목은\n게시가 제한될 수 있어요.)"
          textView.textColor = Color.daangnGray5
        }
      }
}

extension TextViewTVC {
    private func setLayouts() {
        setViewHierarchies()
        setConstraints()
    }

    private func setViewHierarchies() {
        contentView.addSubviews(textView)
    }

    private func setConstraints() {
        textView.snp.makeConstraints {
            $0.top.trailing.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-100)
        }
    }
}
