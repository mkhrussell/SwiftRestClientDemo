//
//  User.swift
//  SwiftFit
//
//  Created by Kamrul Hasan on 14/12/19.
//  Copyright © 2019 Kamrul Hasan. All rights reserved.
//

import Foundation

/*
 {
     "id": 3,
     "name": "Clementine Bauch",
     "username": "Samantha",
     "email": "Nathan@yesenia.net",
     "address": {
         "street": "Douglas Extension",
         "suite": "Suite 847",
         "city": "McKenziehaven",
         "zipcode": "59590-4157",
         "geo": {
             "lat": "-68.6102",
             "long": "-47.0653"
         }
     },
     "phone": "1-463-123-4447",
     "website": "ramiro.info",
     "company": {
         "name": "Romaguera-Jacobson",
         "catchPhrase": "Face to face bifurcated interface",
         "bs": "e-enable strategic applications"
     }
 }
 */

struct Geo: Codable {
    let lat: String
    let long: String

    enum CodingKeys: String, CodingKey {
        case lat
        case long = "lng"
    }
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let business: String

    enum CodingKeys: String, CodingKey {
        case name, catchPhrase
        case business = "bs"
    }
}

struct User: Codable {
    let id: Int
    let name: String
    let nickname: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company

    enum CodingKeys: String, CodingKey {
        case id, name, email, address, phone, website, company
        case nickname = "username"
    }
}
