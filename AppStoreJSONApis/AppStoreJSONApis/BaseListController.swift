//
//  BaseListController.swift
//  AppStoreJSONApis
//
//  Created by Ivan Pestov on 08.04.2022.
//

import Foundation
import UIKit

class BaseListController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
