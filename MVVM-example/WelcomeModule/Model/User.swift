//
//  User.swift
//  MVVM-example
//
//  Created by Mikhail on 18.10.2022.
//

import Foundation

struct User {
    let login: String
    let password: String
}

// example of user
extension User {
    static var defaultLogin = User(login: "default", password: "qwerty")
}
