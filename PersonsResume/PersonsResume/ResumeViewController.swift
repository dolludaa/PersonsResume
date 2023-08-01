//
//  ResumeViewController.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import UIKit
import Foundation

protocol ResumeViewControllerDelegate {

}

class ResumeViewController: UIViewController {

    private let topViewContainer = UIView()
    private let titleLabel = UILabel()
    private let avatarImageView = UIImageView()
    private let fullNameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let townLabel = UILabel()

    private let avatarSize: CGFloat = 150

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
        setUpLayout()
    }

    private func setUpLayout() {
        topViewContainer.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        townLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(topViewContainer)
        topViewContainer.addSubview(titleLabel)
        topViewContainer.addSubview(avatarImageView)
        topViewContainer.addSubview(fullNameLabel)
        topViewContainer.addSubview(descriptionLabel)
        topViewContainer.addSubview(townLabel)

        NSLayoutConstraint.activate([

            topViewContainer.topAnchor.constraint(equalTo: view.topAnchor),
            topViewContainer.bottomAnchor.constraint(equalTo: townLabel.bottomAnchor, constant: 19),
            topViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            titleLabel.topAnchor.constraint(equalTo: topViewContainer.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor),

            avatarImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 42),
            avatarImageView.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 120),
            avatarImageView.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -120),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarSize),

            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 100),
            fullNameLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -100),

            descriptionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -30),

            townLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            townLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 30),
            townLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -30),
        ])
    }

    private func setUpStyle() {
        view.backgroundColor = .white
        topViewContainer.backgroundColor = AppColorEnum.backgroundColor.color


        titleLabel.text = "Профиль"
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textAlignment = .center

        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = avatarSize / 2

        fullNameLabel.text = "Долонтаева Людмила Батаевна"
        fullNameLabel.numberOfLines = 0
        fullNameLabel.adjustsFontSizeToFitWidth = true
        fullNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        fullNameLabel.textAlignment = .center

        descriptionLabel.text = "Начинающий iOS-разработчик, опыт 1 год :)"
        descriptionLabel.textColor = AppColorEnum.descriptionTextColor.color
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textAlignment = .center

        let image = UIImage(named: "town")

        let attachment = NSTextAttachment()
        attachment.image = image

        let attributedString = NSMutableAttributedString(string: "Москва")
        attributedString.insert(NSAttributedString(attachment: attachment), at: 0)
        townLabel.attributedText = attributedString
        townLabel.textColor = AppColorEnum.descriptionTextColor.color
        townLabel.numberOfLines = 0
        townLabel.adjustsFontSizeToFitWidth = true
        townLabel.font = .systemFont(ofSize: 14, weight: .regular)
        townLabel.textAlignment = .center
    }

}

