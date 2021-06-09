//
//  UserDefaultsManager.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    // MARK:- Singleton
    private static let sharedInstance = UserDefaultsManager()
    
    class func shared() -> UserDefaultsManager {
        return UserDefaultsManager.sharedInstance
    }
    
    // MARK:- Properties
    var isLoggedIn: Bool {
        set{
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.isLoggedIn)
        }
        get{
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.isLoggedIn)
        }
    }
    
    var token: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.token)
        }
        get {
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.token) != nil else {
                return nil
            }
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.token)!
        }
    }
}
