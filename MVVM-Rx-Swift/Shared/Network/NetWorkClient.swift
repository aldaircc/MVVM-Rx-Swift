//
//  NetworkClient.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/16/20.
//

import Foundation

enum HttpMethod: String {
    case Get
    case Post
}

enum ResponseNetWork<T> {
    case success(T)
    case failure(Error)
}

protocol NetWorkClient {
    func callService<T: Codable>(_ url: String, method: HttpMethod, body: Data?, headers: [String: String]?, objectType: T.Type, completion: @escaping ((ResponseNetWork<T>)-> Void))
}

extension NetWorkClient {
    func callService<T: Codable>(_ url: String,
                                 method: HttpMethod,
                                 body: Data? = nil,
                                 headers: [String: String]? = nil,
                                 objectType: T.Type,
                                 completion: @escaping ((ResponseNetWork<T>)-> Void)) {
        guard let url = URL.init(string: url) else {
            return
        }
        
        var request = URLRequest.init(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            if let error = error as? NSError {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Json")
                    print(jsonObject)
                    let decoder = JSONDecoder()
                    let objectDecoded = try decoder.decode(objectType.self, from: data)
                    completion(.success(objectDecoded))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
