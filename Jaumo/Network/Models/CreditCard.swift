//
//  CreditCard.swift
//  Jaumo
//
//  Created by Lefteris Haritou on 28/09/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Foundation

struct CreditCard: Codable {
    let expiration, number: String
    let pin, security: Int
}
