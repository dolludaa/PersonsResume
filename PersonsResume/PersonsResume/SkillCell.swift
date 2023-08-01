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

    private let skillTextLabel = UILabel()
    private let closeButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupLayout()
        setupStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {

        skillTextLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(skillTextLabel)
        contentView.addSubview(closeButton)

        NSLayoutConstraint.activate([
            skillTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            skillTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            skillTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            closeButton.widthAnchor.constraint(equalToConstant: 24),
            closeButton.heightAnchor.constraint(equalToConstant: 24),
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
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


        if isEditMode {
            skillTextLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -10).isActive = true

        } else {
            skillTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        }

        skillTextLabel.invalidateIntrinsicContentSize()
        contentView.layoutIfNeeded()


    }

    private func setUp() {
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
    }

    @objc private func didTapClose() {
      // передать во вьюмодель запрос на удаление навыка
    }
}
