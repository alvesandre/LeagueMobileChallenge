//
//  Post.swift
//  LeagueMobileChallenge
//
//  Created by André Alves on 18/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import Foundation
public struct Post: Decodable {
//{
//    "userId": 3,
//    "id": 26,
//    "title": "est et quae odit qui non",
//    "body": "similique esse doloribus nihil ..."
//}
    var userId: Int?
    var user: User?
    var id: Int?
    var title: String?
    var body: String?
}
