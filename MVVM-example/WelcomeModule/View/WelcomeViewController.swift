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
        label.font = .systemFont(ofSize: Constants.defaultSize30)
        return label
    }()
    
    private let loginLabel = UILabel.makeDefaultLabel20(text: "Login")
    private let loginTextField = UITextField.makeDefaultTextField()
    private let passwordLabel = UILabel.makeDefaultLabel20(text: "Password")
    private let passwordTextField = UITextField.makeDefaultTextField()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius5
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
        stackView.spacing = Constants.customSpacing10
        stackView.setCustomSpacing(Constants.customSpacing50, after: mainLabel)
        stackView.setCustomSpacing(Constants.customSpacing20, after: loginTextField)
        stackView.setCustomSpacing(Constants.customSpacing20, after: passwordTextField)
        return stackView
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        setupBinders()
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
    }
    
    private func setupBinders()

    @objc private func loginButtonTapped() {
        print(#function)
    }
}

// MARK: - setConstraints
extension WelcomeViewController {
    private func setConstraints() {
        // change view margins
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: .zero,
                                                                leading: Constants.customSpacing20,
                                                                bottom: .zero,
                                                                trailing: Constants.customSpacing20)
        let margins = view.layoutMarginsGuide
        mainStackView.frame = view.layoutMarginsGuide.layoutFrame
        
        // set constraints
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
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
