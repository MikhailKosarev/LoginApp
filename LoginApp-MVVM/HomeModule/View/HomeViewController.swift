//
//  HomeViewController.swift
//  MVVM-example
//
//  Created by Mikhail on 18.10.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Declare UI elements
    private let mainWelcomeLabel = UILabel.makeDefaultMainLabel()
    
    // MARK: - Private properties
    private let homeViewModel = HomeViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBinders()
        setConstraints()
        homeViewModel.getLoggedInUser()
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(mainWelcomeLabel)
    }
    
    private func setupBinders() {
        homeViewModel.welcomeMessage.bind() { [weak self] welcomeMessage in
            self?.mainWelcomeLabel.text = welcomeMessage
        }
    }
    
    private func setConstraints() {
        // change view margins
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: .zero,
                                                                leading: Constants.customSpacing20,
                                                                bottom: .zero,
                                                                trailing: Constants.customSpacing20)
        let margins = view.layoutMarginsGuide
        
        // set constraints
        NSLayoutConstraint.activate([
            mainWelcomeLabel.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            mainWelcomeLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
        ])
    }
}


#if DEBUG
import SwiftUI

struct HomeViewController_Preview: PreviewProvider {
    static var previews: some View {
        HomeViewController().showPreview()
    }
}
#endif
