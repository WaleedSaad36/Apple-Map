//
//  APIRouter.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible{
    
    case login(email : String, password:String)
    case register(name: String, email: String, password: String, phone:String, image: String)
    
    
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self{
            // case:
            // return .get
            // case :
        // return .delete
        default:
            return .post
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return [ParameterKeys.email: email, ParameterKeys.password:password]
        case .register(let name, let email, let password, let phone, let image):
            return [ParameterKeys.name: name, ParameterKeys.email: email, ParameterKeys.password: password, ParameterKeys.phone: phone, ParameterKeys.image: image]
        default:
            return nil
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        //URLs
        case .login(let email, let password):
            return URLs.login
        case .register(let name, let email, let password, let phone, let image):
            return URLs.register
            
        }
    }
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try URLs.base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //httpMethod
        urlRequest.httpMethod = method.rawValue
        
        switch self {
            
        default:
            urlRequest.setValue("en", forHTTPHeaderField: HeaderKeys.acceptLanguage)
        }
        let token = UserDefaultsManager.shared().token
        urlRequest.setValue("Bearer \(token ?? "") ", forHTTPHeaderField: HeaderKeys.authorization)
        urlRequest.setValue("en", forHTTPHeaderField: HeaderKeys.acceptLanguage)
        urlRequest.setValue("application/json", forHTTPHeaderField: HeaderKeys.contentType)
        urlRequest.setValue("application/json", forHTTPHeaderField: HeaderKeys.accept)
        
        // HTTP Body
        let httpBody: Data? = {
            switch self {
            default:
                return nil
            }
        }()
        urlRequest.httpBody = httpBody
        
        // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get, .delete:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        print(try encoding.encode(urlRequest, with: parameters))
        return try encoding.encode(urlRequest, with: parameters)
    }
}

extension APIRouter {
    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
        do {
            let anyEncodable = AnyEncodable(body)
            let jsonData = try JSONEncoder().encode(anyEncodable)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
    
    
    // type-erasing wrapper
    struct AnyEncodable: Encodable {
        private let _encode: (Encoder) throws -> Void
        
        public init<T: Encodable>(_ wrapped: T) {
            _encode = wrapped.encode
        }
        
        func encode(to encoder: Encoder) throws {
            try _encode(encoder)
        }
    }
    
}

