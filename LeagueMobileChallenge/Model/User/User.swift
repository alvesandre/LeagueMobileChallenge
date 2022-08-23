//
//  User.swift
//  LeagueMobileChallenge
//
//  Created by André Alves on 18/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import Foundation
public struct User: Decodable {
//    {
//        "id": 1,
//        "avatar": "https://i.pravatar.cc/150?u=1",
//        "name": "Leanne Graham",
//        "username": "Bret",
//        "email": "Sincere@april.biz",
//        "address": {
//            "street": "Kulas Light",
//            "suite": "Apt. 556",
//            "city": "Gwenborough",
//            "zipcode": "92998-3874",
//            "geo": {
//                "lat": "-37.3159",
//                "lng": "81.1496"
//            }
//        },
//        "phone": "1-770-736-8031 x56442",
//        "website": "hildegard.org",
//        "company": {
//            "name": "Romaguera-Crona",
//            "catchPhrase": "Multi-layered...",
//            "bs": "harness real-time e-markets"
//        }
//    }
    var id: Int?
    var avatar: URL?
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?
}
