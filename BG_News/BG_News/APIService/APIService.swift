//
//  APIService.swift
//  BG_News
//
//  Created by bhavesh on 10/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

class APIService {

    static var shared: APIService =  APIService()

    private init() { }

    func fetchNews<T: Codable>(path: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: path) else {
            print("URL is not valid")
            completion(.failure(APIError.urlNotValid))
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in


            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.unknownErrorOccured))
                }
                return
            }

            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    enum APIError: Error {
        case urlNotValid
        case unknownErrorOccured
    }

}
