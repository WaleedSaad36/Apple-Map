//
//  APIManager.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import Alamofire

class APIManager {
    // MARK:- Auth -> [login , Register]
    class func login(email:String, password:String, completion: @escaping (Result<AuthResponse, Error>) -> Void){
        request(APIRouter.login(email: email, password: password)){ (response) in
            completion(response)
        }
    }
    class func register(name: String, email: String, password: String, phone:String, image: String, completion: @escaping (Result<AuthResponse, Error>) -> Void){
        request(APIRouter.register(name: name, email: email, password: password, phone: phone, image: image)){ (response) in
            completion(response)
        }
    }
}

extension APIManager{
    // MARK:- The request function to get results in a closure
    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
            }
            .responseJSON { response in
                switch response.result {
                    
                case .failure(let error):
                    completion(.failure(error))
                default:
                    return
                }
                print(response)
        }
    }
    
}


