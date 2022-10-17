//
//  ViewController.swift
//  MVVM-example
//
//  Created by Mikhail on 16.10.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Declare UI elements
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainLabel,
                                                       loginLabel,
                                                       loginTextField,
                                                       passwordLabel,
                                                       passwordTextField,
                                                      loginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.setCustomSpacing(50, after: mainLabel)
        stackView.setCustomSpacing(20, after: loginTextField)
        stackView.setCustomSpacing(20, after: passwordTextField)
        return stackView
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    // MARK: - Private methods
    private func setupView() {
//        view.addSubview(mainLabel)
        view.backgroundColor = .white
        view.addSubview(mainStackView)
    }
    
    private func setConstraints() {
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0,
                                                                leading: 20,
                                                                bottom: 0,
                                                                trailing: 20)
        let margins = view.layoutMarginsGuide
        mainStackView.frame = view.layoutMarginsGuide.layoutFrame
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
    }
    
    @objc private func loginButtonTapped() {
        print(#function)
    }
}


#if DEBUG
import SwiftUI

struct CurrentWeatherViewController_Preview: PreviewProvider {
    static var previews: some View {
        WelcomeViewController().showPreview()
    }
}
#endif
