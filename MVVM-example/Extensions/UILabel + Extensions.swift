//
//  UILabel + Extensions.swift
//  MVVM-example
//
//  Created by Mikhail on 17.10.2022.
//

import UIKit

extension UILabel {
    static func makeDefaultLabel20(text: String) -> UILabel {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = text
            label.font = .systemFont(ofSize: Constants.defaultSize20)
            return label
    }
}
