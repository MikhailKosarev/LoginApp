//
//  ViewModel.swift
//  MVVM-example
//
//  Created by Mikhail on 18.10.2022.
//

import Foundation

final class WelcomeViewModel {
    var error: ObservableObject<LoginResult?> = ObservableObject(nil)
    
    func login(login: String, password: String) {
        if login != User.defaultLogin.login || password != User.defaultLogin.password {
            self.error.value = LoginResult.error
        } else {
            self.error.value = LoginResult.success
        }
    }
}
