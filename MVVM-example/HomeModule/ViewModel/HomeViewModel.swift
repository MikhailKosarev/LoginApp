//
//  File.swift
//  MVVM-example
//
//  Created by Mikhail on 18.10.2022.
//

import Foundation

final class HomeViewModel {
    var welcomeMessage: ObservableObject<String?> = ObservableObject(nil)
    
    func getLoggedInUser() {
        let user = User.defaultLogin
        self.welcomeMessage.value = "Hello, \(user.login)"
    }
}
