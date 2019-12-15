//
//  ReqresClient.swift
//  SwiftFit
//
//  Created by Kamrul Hasan on 14/12/19.
//  Copyright © 2019 Kamrul Hasan. All rights reserved.
//

import Foundation

class TypicodeClient {
    let host = "jsonplaceholder.typicode.com"

    enum Api {
        case user(id: Int)
        case users
    }

    func getUrl(api: Api) -> URL {
        var urlComponents = URLComponents()
        urlComponents.host = host
        urlComponents.scheme = "https"

        let path: String
        switch api {
            case .user(let id):
                path = "/users/\(id)"
            case .users:
                path = "/users"
        }
        urlComponents.path = path
        return urlComponents.url!
    }

    func fetchUser(id: Int, completion: @escaping (User?) -> Void) {
        var urlRequest = URLRequest(url: getUrl(api: .user(id: id)))
        urlRequest.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let jsonData = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let user = try jsonDecoder.decode(User.self, from: jsonData)
                    completion(user)
                } catch {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
    }

    func fetchUsers(completion: @escaping ([User]?) -> Void) {
        var urlRequest = URLRequest(url: getUrl(api: .users))
        urlRequest.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: urlRequest) { nwData, urlResponse, nwError in
            if let jsonData = nwData {
                do {
                    let jsonDecoder = JSONDecoder()
                    let users = try jsonDecoder.decode([User].self, from: jsonData)
                    completion(users)
                } catch {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
