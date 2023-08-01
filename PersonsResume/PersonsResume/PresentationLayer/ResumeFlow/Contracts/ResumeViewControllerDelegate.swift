//
//  ResumeViewControllerDelegate.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import Foundation
import UIKit

protocol ResumeViewControllerDelegate: AnyObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func editDidTap()
}
