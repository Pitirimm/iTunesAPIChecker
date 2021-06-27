//
//  NetworkService.swift
//  iTunesAPIChecker
//
//  Created by Yuriy Martinovskiy on 25.06.2021.
//

import Foundation

class NetworkService {
    func request(urlString: String, completion: @escaping (Result<ItunesAnswer, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let films = try JSONDecoder().decode(ItunesAnswer.self, from: data)
                    completion(.success(films))
                } catch let jsonError {
                    print("Faild JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
