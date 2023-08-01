//
//  ResumeViewProtocol.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import Foundation
import UIKit

protocol ResumeViewProtocol: UIView {
    func didLoad()
    func reloadData()
    func buttonChange(image: UIImage?)
    func deleteItemsInCollectionView(indexPath: IndexPath)
    var collectionForCell: UICollectionView { get }
}
