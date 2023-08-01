//
//  SkillsService.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import Foundation

class SkillsService: SkillsServiceProtocol {

    private let userDefaults = UserDefaults.standard
    private let skillsKey = "Skills"
    private let defaultSkills = [
        SkillModel(skill: "Swift"),
        SkillModel(skill: "SwiftUI"),
        SkillModel(skill: "iOS Development"),
        SkillModel(skill: "REST APIs"),
        SkillModel(skill: "Git"),
        SkillModel(skill: "Python"),
        SkillModel(skill: "Unit Testing")
    ]

    func fetchSkills() -> [SkillModel] {
        guard let data = userDefaults.object(forKey: skillsKey) as? Data
        else { return defaultSkills }

        let skills = (try? JSONDecoder().decode([SkillModel].self, from: data)) ?? []
        return skills.isEmpty ? defaultSkills : skills
    }

    func saveSkills(_ skills: [SkillModel]) {
        guard let data = try? JSONEncoder().encode(skills)
        else { return }
        userDefaults.set(data, forKey: skillsKey)
    }
}
