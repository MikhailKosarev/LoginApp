//
//  ViewModel.swift
//  MVVM-example
//
//  Created by Mikhail on 18.10.2022.
//

import Foundation

final class WelcomeViewModel {
    func login(login: String, password: String) {
        if login != User.defaultLogin.login || password != User.defaultLogin.password {
            print("error")
        } else {
            print("ok")
        }
    }
}
