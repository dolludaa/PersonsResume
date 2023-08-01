//
//  SkillsService.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import Foundation

class SkillsService {

  static let shared = SkillsService()

  private init() {}

  func getSkills() -> [SkillModel] {
    let skills = [
      SkillModel(skill: "Swift"),
      SkillModel(skill: "SwiftUI"),
      SkillModel(skill: "iOS Development"),
      SkillModel(skill: "REST APIs"),
      SkillModel(skill: "Git"),
      SkillModel(skill: "Python"),
      SkillModel(skill: "Unit Testing")
    ]

    return skills
  }

}
