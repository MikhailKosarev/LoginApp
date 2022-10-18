//
//  ObservableObject.swift
//  MVVM-example
//
//  Created by Mikhail on 18.10.2022.
//

import Foundation

final class ObservableObject<T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping(T) -> Void) {
        listener(value) // do we need this line?
        self.listener = listener
    }
}
