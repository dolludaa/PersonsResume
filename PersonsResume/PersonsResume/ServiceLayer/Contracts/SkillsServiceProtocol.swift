//
//  SkillsServiceProtocol.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import Foundation

protocol SkillsServiceProtocol {
    func fetchSkills() -> [SkillModel]
    func saveSkills(_ skills: [SkillModel])
}
