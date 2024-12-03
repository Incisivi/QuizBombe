//
//  UserViewModel.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 02.12.24.
//

import Foundation

import Foundation
import SwiftData

@Model
class UserModel: Hashable, Identifiable {
    
    var id: String
    var name: String
    var age: String
    var birthday: String
    var adress: String
    var password: String
    
    init(id: String, name: String, age: String, birthday: String, adress: String, password: String) {
        self.id = id
        self.name = name
        self.age = age
        self.birthday = birthday
        self.adress = adress
        self.password = password
    }
    
}//
