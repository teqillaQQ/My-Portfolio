//
//  People.swift
//  SavkovTestAppForITSPartner
//
//  Created by Александр Савков on 10.01.22.
//

import Foundation

struct People {
    
    var id: String = ""
    var index: Int = 0
    var guid: String = ""
    var isActive: Bool
    var balance: String?
    var picture: String?
    var age: Int?
    var eyeColor, name, gender, company: String?
    var email, phone, address, about: String?
    var registered: String?
    var latitude, longitude: Double?
    var tags: [String]?
    var friends: [Friend]?
    var greeting, favoriteFruit: String?
}

