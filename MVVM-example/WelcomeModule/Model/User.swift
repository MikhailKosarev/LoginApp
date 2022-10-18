//
//  User.swift
//  MVVM-example
//
//  Created by Mikhail on 18.10.2022.
//

import Foundation

struct User {
    let login: String
    let passwords: String
}

extension User {
    static var logins = [
        User(login: "default", passwords: "qwerty")
    ]
}
