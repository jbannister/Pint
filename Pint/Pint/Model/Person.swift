//
//  Person.swift
//  Pint
//
//  Created by Jan Bannister on 18/03/2024.
//

import Foundation
import Contacts

class Person: Identifiable {
    let id = UUID()
    let name: String

    init(name: String) {
        self.name = name
    }
}
