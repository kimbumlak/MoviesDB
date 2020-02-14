//
//  API.swift
//  MoviesDB
//
//  Created by BumLak Kim on 2/13/20.
//  Copyright © 2020 BumLak Kim. All rights reserved.
//

import Foundation
import Alamofire

private let baseUrl = "https://api.themoviedb.org/3/movie/"
let posterUrl = "https://image.tmdb.org/t/p/original"
private let apiKey = "a9f4f2deb8fd08f2b70a197b03f5fa21"
private let coder = JSONDecoder()

class API {
    class func fetchPopularMovies(_ onSuccess: @escaping (Results) -> Void) {
        coder.keyDecodingStrategy = .convertFromSnakeCase
        let urlStr = "\(baseUrl)popular?api_key=\(apiKey)"
        guard let url = URL(string: urlStr) else {fatalError("Unable to get url")}
        
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else {fatalError("Unable to parse data from api")}
                guard let results = try? coder.decode(Results.self, from: data) else {fatalError("Unable to parse data into json")}
                DispatchQueue.main.async {
                    onSuccess(results)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
