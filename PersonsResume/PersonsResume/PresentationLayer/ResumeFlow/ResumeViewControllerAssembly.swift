//
//  ResumeViewControllerAssembly.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import Foundation
import UIKit

struct ResumeViewControllerAssembly {
    func create() -> UIViewController {
        let resumeView = ResumeView()

        let controller = ResumeViewController(resumeView: resumeView)

        resumeView.delegate = controller

        return controller
    }
}
