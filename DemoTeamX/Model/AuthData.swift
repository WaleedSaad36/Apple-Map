//
//  AuthData.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import Foundation
struct AuthResponse: Codable{
    var data:AuthData?
    var status: Bool?
    var message: String?
}

struct AuthData: Codable {
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    var image: String?
    var token: String?
    enum CodingKeys: String, CodingKey  {
        case id, name, email, phone, image, token
    }
}
