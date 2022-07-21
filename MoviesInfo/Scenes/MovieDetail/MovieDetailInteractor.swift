//
//  MovieDetailInteractor.swift
//  MoviesInfo
//
//  Created by YEH on 21/7/2022.
//

import Foundation

protocol MovieDetailBusinessLogic {
    func getMoviesDetail(using movieID: String)
}

class MovieDetailInteractor: MovieDetailBusinessLogic {
    
    let networkManager: NetworkManagerProtocol
    let presenter: MovieDetailPresentationLogic
    
    init(networkManager: NetworkManagerProtocol, presenter: MovieDetailPresentationLogic) {
        self.networkManager = networkManager
        self.presenter = presenter
    }
    
    func getMoviesDetail(using movieID: String) {
        let queryParams = ["api_key": NetworkConfig.shared.apiKey]
        
        networkManager.makeRequest(ws: "movie_detail", path: movieID, query: queryParams, params: nil) { [weak self] (result, status) in
            
            if let result = result as? Data {
                do {
                    let response = try JSONDecoder().decode(Movie.self, from: result)
                    self?.presenter.presentMovieDetail(response)
                } catch {
                    print(error)
                    self?.presenter.presentError(error.localizedDescription)
                }
            }
            
        }
    }
}
