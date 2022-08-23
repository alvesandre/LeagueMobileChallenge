//
//  API.swift
//  LeagueMobileChallenge
//
//  Created by Kelvin Lau on 2019-01-14.
//  Copyright © 2019 Kelvin Lau. All rights reserved.
//

import Foundation
import Alamofire


// MARK: - Handling errors

enum APIError: Error {
    case parseFailed
    case emptyData
    case noUserToken
    case unknown
}

// MARK: - Aliases for completions

typealias RequestCompletion = (Result<Data>) -> Void
typealias UserTokenCompletion = (Result<String>) -> Void
typealias PostsCompletion = (Result<[Post]>) -> Void
typealias UsersCompletion = (Result<[User]>) -> Void
typealias UserCompletion = (Result<User>) -> Void

// MARK: - String Constants

fileprivate enum Constants {
    static let API_KEY: String = "api_key"
    static let LOGIN: String = "login"
    static let POSTS: String = "posts"
    static let USERS: String = "users"
    static let X_ACCESS_TOKEN: String = "x-access-token"
}

// MARK: - API

class API {
    static let domain = "https://engineering.league.dev/challenge/api/"
    fileprivate let loginAPI = domain + Constants.LOGIN
    fileprivate let postAPI = domain + Constants.POSTS
    fileprivate let userAPI = domain + Constants.USERS
    
    static let shared = API()
    
    fileprivate var userToken: String?
    
    func fetchUserToken(userName: String = "", password: String = "", completion: @escaping UserTokenCompletion) {
        guard let url = URL(string: loginAPI) else {
            return
        }
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: userName, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        Alamofire.request(url, headers: headers).responseJSON { (response) in
            if let error = response.error {
                completion(.failure(error))
                return
            }
            
            if let value = response.result.value as? [AnyHashable : Any],
               let userToken = value[Constants.API_KEY] as? String {
                self.userToken = userToken
                completion(.success(userToken))
            }
        }
    }
    
    func fetchPosts(completion: @escaping PostsCompletion) {
        guard let url = URL(string: postAPI) else {
            return
        }
        
        request(url: url) { result in
            switch result {
            case .success(let data):
                if let posts = try? JSONDecoder().decode([Post].self, from: data) {
                    completion(.success(posts))
                } else {
                    completion(.failure(APIError.parseFailed))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    func fetchUsers(completion: @escaping UsersCompletion) {
        guard let url = URL(string: userAPI) else {
            return
        }
        
        request(url: url) { result in
            switch result {
            case .success(let data):
                if let users = try? JSONDecoder().decode([User].self, from: data) {
                    completion(.success(users))
                } else {
                    completion(.failure(APIError.parseFailed))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchUser(with userId: Int, completion: @escaping UserCompletion) {
        guard let url = URL(string: "\(userAPI)/\(userId)") else {
            return
        }
        
        request(url: url) { result in
            switch result {
            case .success(let data):
                if let user = try? JSONDecoder().decode(User.self, from: data) {
                    completion(.success(user))
                } else {
                    completion(.failure(APIError.parseFailed))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func request(url: URL, completion: @escaping RequestCompletion) {
        guard let userToken = userToken else {
            completion(.failure(APIError.noUserToken))
            return
        }
        
        let authHeader: HTTPHeaders = [Constants.X_ACCESS_TOKEN : userToken]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: authHeader).responseJSON { (response) in
            
            if let error = response.error {
                completion(.failure(error))
            }
            
            if let data = response.data {
                completion(.success(data))
            } else {
                completion(.failure(APIError.emptyData))
            }
        }
    }
}
