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

    var isEditMode = false

    private let scrollView = UIScrollView()
    private let scrollContainerView = UIView()
    private let topViewContainer = UIView()
    private let titleLabel = UILabel()
    private let avatarImageView = UIImageView()
    private let editButton = UIButton()
    private let fullNameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let townLabel = UILabel()
    private let aboutMeLabel = UILabel()
    private let textMyDescription = UILabel()
    private let mySkillsLabel = UILabel()
    private let alignedFlowLayout = LeftAlignedCollectionViewFlowLayout()
    lazy var collectionView = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: alignedFlowLayout)

    private let avatarSize: CGFloat = 150

    private let skillModel = SkillsService.shared.getSkills()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
        setUpLayout()
        setUp()

    }

    private func setUpLayout() {
        let scrollContentGuide = scrollView.contentLayoutGuide

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.translatesAutoresizingMaskIntoConstraints = false
        topViewContainer.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        townLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        textMyDescription.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        mySkillsLabel.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.addSubview(topViewContainer)
        scrollContainerView.addSubview(aboutMeLabel)
        scrollContainerView.addSubview(textMyDescription)
        scrollContainerView.addSubview(collectionView)
        scrollContainerView.addSubview(mySkillsLabel)
        scrollContainerView.addSubview(editButton)
        topViewContainer.addSubview(titleLabel)
        topViewContainer.addSubview(avatarImageView)
        topViewContainer.addSubview(fullNameLabel)
        topViewContainer.addSubview(descriptionLabel)
        topViewContainer.addSubview(townLabel)

        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            scrollContainerView.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            scrollContainerView.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            scrollContainerView.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),

            scrollContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            topViewContainer.topAnchor.constraint(equalTo: scrollContainerView.topAnchor),
            topViewContainer.bottomAnchor.constraint(equalTo: townLabel.bottomAnchor, constant: 19),
            topViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            titleLabel.topAnchor.constraint(equalTo: topViewContainer.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor),

            avatarImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 42),
            avatarImageView.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 120),
            avatarImageView.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -120),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize),

            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 100),
            fullNameLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -100),

            descriptionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -30),

            townLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            townLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 30),
            townLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -30),

            mySkillsLabel.topAnchor.constraint(equalTo: townLabel.bottomAnchor, constant: 40),
            mySkillsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            editButton.topAnchor.constraint(equalTo: townLabel.bottomAnchor, constant: 40),

            collectionView.topAnchor.constraint(equalTo: mySkillsLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            aboutMeLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 24),
            aboutMeLabel.leadingAnchor.constraint(equalTo: scrollContainerView.leadingAnchor, constant: 16),

            textMyDescription.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 8),
            textMyDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textMyDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textMyDescription.bottomAnchor.constraint(equalTo: scrollContainerView.bottomAnchor)

        ])
    }

    private func setUpStyle() {
        view.backgroundColor = .white
        topViewContainer.backgroundColor = AppColorEnum.backgroundColor.color

        scrollView.frame = view.bounds
        scrollView.clipsToBounds = true
        scrollView.contentInsetAdjustmentBehavior = .always

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

        aboutMeLabel.text = "О себе"
        aboutMeLabel.textAlignment = .left
        aboutMeLabel.font = .systemFont(ofSize: 16, weight: .medium)

        textMyDescription.text = "Привет! Я начинающий программист, специализирующийся на мобильной разработке приложений. У меня год опыта работы, пройдено множество курсов и обучающих видео. Я люблю решать задачи на литкоде, это помогает мне улучшить свои навыки и алгоритмическое мышление. Увлеченно самообразование позволяет быть в курсе последних тенденций и новых технологий. Собственный ментор поддерживает и помогает развиваться профессионально. Мир мобильной разработки захватывает меня, и я с нетерпением ожидаю новых возможностей и проектов, которые будут приносить удовлетворение и вдохновение. Программирование для меня - это не только работа, но и страсть, которая делает жизнь интересной и насыщенной."
        textMyDescription.textAlignment = .left
        textMyDescription.numberOfLines = 0
        textMyDescription.font = .systemFont(ofSize: 14, weight: .regular)
        collectionView.dataSource = self
        collectionView.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.reuseIdentifier)

        alignedFlowLayout.estimatedItemSize = CGSize(width: view.frame.width - 48, height: 20)

        mySkillsLabel.text = "Мои навыки"
        mySkillsLabel.font = .systemFont(ofSize: 16, weight: .medium)

        scrollView.isScrollEnabled = true
        editButton.setImage(UIImage(named: "editButton"), for: .normal)
    }

    private func setUp() {
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)

    }

    @objc private func editButtonTapped() {

        isEditMode.toggle()
        collectionView.reloadData()

        //        let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка, которым вы владеете", preferredStyle: .alert)
        //
        //        alert.addTextField { textField in
        //          textField.placeholder = "Введите название"
        //        }
        //
        //        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        //        alert.addAction(cancelAction)
        //
        //        let addAction = UIAlertAction(title: "Добавить", style: .default) { action in
        //            _ = alert.textFields?.first?.text
        //
        //        }
        //        alert.addAction(addAction)
        //
        //        present(alert, animated: true)
    }

}

extension ResumeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let count = skillModel.count
//
//        if isEditMode {
//            return count + 1
//        } else {
//            return count
//        }
        return skillModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SkillCell.reuseIdentifier,
            for: indexPath
        ) as? SkillCell
        else { return UICollectionViewCell() }
        let skill = skillModel[indexPath.row]
        cell.configure(model: skill, isEditMode: isEditMode)

        return cell
    }


}
