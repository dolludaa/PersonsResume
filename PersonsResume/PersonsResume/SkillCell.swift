//
//  SkillCell.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import Foundation
import UIKit

protocol SkillCellProtocol {

}

final class SkillCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: SkillCell.self)

    var imageLoader: SkillCellProtocol?
    var onCloseTapped: (() -> Void)?

    private let skillTextLabel = UILabel()
    private let closeButton = UIButton()

    private var textTrailing: NSLayoutConstraint?
    private var textClosedButtonTrailing: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupLayout()
        setupStyle()
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {

        skillTextLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(skillTextLabel)
        contentView.addSubview(closeButton)

        textTrailing = skillTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        textTrailing?.isActive = true

        textClosedButtonTrailing = skillTextLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -10)

        NSLayoutConstraint.activate([
            skillTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            skillTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            skillTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            closeButton.widthAnchor.constraint(equalToConstant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 16),
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
    }

    private func setupStyle() {

        contentView.backgroundColor = AppColorEnum.backgroundColor.color
        contentView.layer.cornerRadius = 12
        skillTextLabel.textColor = .black
        skillTextLabel.font = .systemFont(ofSize: 16)
        skillTextLabel.adjustsFontSizeToFitWidth = true
        skillTextLabel.minimumScaleFactor = 0.5
        skillTextLabel.lineBreakMode = .byTruncatingTail
        closeButton.tintColor = .black
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
    }

    func configure(model: SkillModel, isEditMode: Bool) {
        skillTextLabel.text = model.skill
        closeButton.isHidden = !isEditMode
        closeButton.isEnabled = isEditMode

        textTrailing?.isActive = !isEditMode
        textClosedButtonTrailing?.isActive = isEditMode

        skillTextLabel.invalidateIntrinsicContentSize()
        contentView.layoutIfNeeded()
    }

    private func setUp() {
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
    }

    @objc private func didTapClose() {
        onCloseTapped?()
    }
}
