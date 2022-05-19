//
//  Extensions.swift
//  AppStoreJSONApis
//
//  Created by Ivan Pestov on 09.04.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}
