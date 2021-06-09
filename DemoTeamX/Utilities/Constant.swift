//
//  Constant.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import Foundation

// Storyboards
struct Storyboards {
    static let auth = "Auth"
    static let map = "Map"
}

// Urls
struct URLs {
    //API
    static let base = "https://student.valuxapps.com/api"
    //auth
    static let login = "/login"
    static let register = "/register"
    static let logout = "/logout"
}

// Header Keys
struct HeaderKeys {
    static let contentType = "Content-Type"
    static let accept = "accept"
    //static let token = "X-CSRF-TOKEN"
    static let acceptLanguage = "lang"
    static let authorization  = "Authorization"
    static let tokenTest = "Bearer UvmpyUOxpS8OajeFyc6EPKupmeihgUsCvU37h2E2pmEVzsj8qV9rSSrDQ2omUJ2bh0dtf6"
}

// Parameters Key
struct ParameterKeys {
    
    static let name = "name"
    static let email = "email"
    static let password = "password"
    static let phone = "phone"
    static let id = "id"
    static let image = "image"
}

// UserDefaultsKeys
struct UserDefaultsKeys {
    static let token = "AccessToken"
    static let isLoggedIn = "IsLoggedIn"
    static let categoryId = "CategoryId"
}
// viewControllers
struct viewControllers {
    static let loginVC = "LoginVC"
    static let registerVC = "RegisterVC"
    static let mapVC = "MapVC"
    static let mainVC = "MainVC"
}

// Custom Cells
struct CustomCells {
    
}
