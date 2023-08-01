//
//  ResumeViewController.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import UIKit
import Foundation

class ResumeViewController: UIViewController {
    
    private var isEditMode = false

    private let service: SkillsServiceProtocol
    private let resumeView: ResumeViewProtocol

    private var skillModels: [SkillModel] = []

    init(resumeView: ResumeViewProtocol, service: SkillsServiceProtocol) {
        self.resumeView = resumeView
        self.service = service 
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        resumeView.didLoad()
    }

    override func loadView() {
        view = resumeView
    }

    private func loadData() {
        skillModels = service.fetchSkills()
        resumeView.reloadData()
    }

    private func deleteItem(skillModel: SkillModel) {
        guard let index = skillModels.firstIndex(where: { $0.skill == skillModel.skill})
        else { return }

        let indexPath = IndexPath(row: index, section: 0)
        skillModels.remove(at: index)
        resumeView.deleteItemsInCollectionView(indexPath: indexPath)
        resumeView.reloadData()
        service.saveSkills(skillModels)
    }

    private func showAddSkillAlert() {

        let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка, которым вы владеете", preferredStyle: .alert)

        alert.addTextField { textField in
            textField.placeholder = "Введите название"
        }

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            guard let skill = alert.textFields?.first?.text else { return }
            self.addSkill(name: skill)
        }

        alert.addAction(addAction)
        present(alert, animated: true)
    }

    private func addSkill(name: String) {

        let newSkill = SkillModel(skill: name)
        skillModels.append(newSkill)

        resumeView.reloadData()
        service.saveSkills(skillModels)
    }

    private func getAddCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AddCell.reuseIdentifier,
            for: indexPath
        ) as? AddCell else { return UICollectionViewCell() }
        cell.onAddTapped = {
            self.showAddSkillAlert()
        }
        return cell
    }

    private func getSkillCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SkillCell.reuseIdentifier,
            for: indexPath
        ) as? SkillCell else { return UICollectionViewCell() }
        
        let skill = skillModels[indexPath.row]
        cell.configure(model: skill, isEditMode: isEditMode, maxWidth: view.frame.width - 40)
        cell.onCloseTapped = { [weak self] in
            guard let self = self else { return }
            self.deleteItem(skillModel: skill)
        }

        return cell
    }
    
}

extension ResumeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = skillModels.count

        if isEditMode {
            return count + 1
        } else {
            return count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if isEditMode, indexPath.row == skillModels.count {
            return getAddCell(collectionView: resumeView.collectionForCell, indexPath: indexPath)
        } else {
            return getSkillCell(collectionView: resumeView.collectionForCell, indexPath: indexPath)
        }
    }
}

extension ResumeViewController: ResumeViewControllerDelegate {
    func editDidTap() {
        isEditMode.toggle()
        resumeView.reloadData()

        let imageName = isEditMode ? "doneButton" : "editButton"
        resumeView.buttonChange(image: UIImage(named: imageName))
    }
}
