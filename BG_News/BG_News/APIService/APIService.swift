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

    let URL_PATH = "https://newsapi.org/v2/top-headlines?country=in&apiKey=452d040207744964b395c0996a51174c"

    func fetchNews<T: Codable>(completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: URL_PATH) else {
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
