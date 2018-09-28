//
//  Profile.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//  Note, generated from https://app.quicktype.io/

import Foundation

typealias Profile = [ProfileElement]

struct ProfileElement: Codable {
    let name, surname, gender, region: String
    let age: Int
    let title, phone: String
    let birthday: Birthday
    let email, password: String
    let creditCard: CreditCard
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case name, surname, gender, region, age, title, phone, birthday, email, password
        case creditCard = "credit_card"
        case photo
    }
}
