//
//  UITextField + Extension.swift
//  MVVM-example
//
//  Created by Mikhail on 17.10.2022.
//

import UIKit

extension UITextField {
    static func makeDefaultTextField() -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.clearButtonMode = .always
        return textField
    }
}
