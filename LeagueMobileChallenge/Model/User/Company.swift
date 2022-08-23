//
//  Company.swift
//  LeagueMobileChallenge
//
//  Created by André Alves on 18/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import Foundation
public struct Company: Decodable {
//   "company": {
//       "name": "Romaguera-Crona",
//       "catchPhrase": "Multi-layered...",
//       "bs": "harness real-time e-markets"
//   }
    var name: String?
    var catchPhrase: String?
    var bs: String?
}
