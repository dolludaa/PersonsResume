//
//  AppColorEnum.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import Foundation
import UIKit

enum AppColorEnum {
    case backgroundColor
    case descriptionTextColor

    var color: UIColor {
        switch self {
        case .backgroundColor:
            return UIColor(hex: 0xF3F3F5)
        case .descriptionTextColor:
            return UIColor(hex: 0x96959B)
        }
    }
}
