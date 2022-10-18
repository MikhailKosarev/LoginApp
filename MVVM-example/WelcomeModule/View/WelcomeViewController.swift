//
//  ViewController.swift
//  MVVM-example
//
//  Created by Mikhail on 16.10.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Declare UI elements
    private let mainLabel = UILabel.makeDefaultMainLabel()
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
    
    // MARK: - Private properties
    private let welcomeViewModel = WelcomeViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        setupBinders()
        
        // hide keyboard when tap somewhere else
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
    }
    
    private func setupBinders() {
        welcomeViewModel.error.bind{ [weak self] result in
            switch result {
            case .success:
                print("success")
            case .error:
                self?.showAlert(title: "Error", message: "Invalid login/password")
            case .none:
                print("no result")
            }
        }
    }

    @objc private func loginButtonTapped() {
        // hide the keyboard
        view.endEditing(true)
        // check if the fields filled
        guard let login = loginTextField.text,
              !login.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty else {
            showAlert(title: "Error", message: "Fill login and password")
            return
        }
        
        welcomeViewModel.login(login: login, password: password)
    }
    
    private func showAlert(title: String, message: String) {
        let alertOk = UIAlertController.alertOk(title: title, message: message)
        present(alertOk, animated: true)
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
        
        // set constraints
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: -Constants.customSpacing50),
            mainStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
    }
}


#if DEBUG
import SwiftUI

struct WelcomeViewController_Preview: PreviewProvider {
    static var previews: some View {
        WelcomeViewController().showPreview()
    }
}
#endif
