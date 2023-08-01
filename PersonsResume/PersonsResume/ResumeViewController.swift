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

    private let titleLabel = UILabel()
    private let avatarImageView = UIImageView()
    private let fullNameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let townLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
        setUpLayout()
        view.setNeedsLayout()
    }

    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()

      avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }

    private func setUpLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        townLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)
        view.addSubview(avatarImageView)
        view.addSubview(fullNameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(townLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            avatarImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            avatarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),

            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            fullNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),

            descriptionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            townLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            townLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            townLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }

    private func setUpStyle() {

        view.backgroundColor = AppColorEnum.backgroundColor.color

        titleLabel.text = "Профиль"
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textAlignment = .center

        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.clipsToBounds = true

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


        townLabel.text = "Москва"
        townLabel.textColor = AppColorEnum.descriptionTextColor.color
        townLabel.numberOfLines = 0
        townLabel.adjustsFontSizeToFitWidth = true
        townLabel.font = .systemFont(ofSize: 14, weight: .regular)
        townLabel.textAlignment = .center
    }

}

