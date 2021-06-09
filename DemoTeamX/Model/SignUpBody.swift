//
//  SignUpBody.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import Foundation
struct SignUpBody:Codable {
    let name: String?
    let email: String?
    let mobile: String?
    let password: String?
    let image: String?
}
