//
//  MoviesListInteractor.swift
//  MoviesInfo
//
//  Created by Yassine EL HALAOUI on 21/7/2022.
//

import Foundation

protocol MoviesListBusinessLogic: AnyObject {
    func getMoviesList()
}

class MoviesListInteractor: MoviesListBusinessLogic {
    
    let networkManager: NetworkManagerProtocol
    let presenter: MoviesListPresentationLogic
    
    init(networkManager: NetworkManagerProtocol, presenter: MoviesListPresentationLogic) {
        self.networkManager = networkManager
        self.presenter = presenter
    }
    
    func getMoviesList() {
        let queryParams = ["api_key": NetworkConfig.shared.apiKey]
        
        networkManager.makeRequest(ws: "movies_list", path: nil, query: queryParams, params: nil) { [weak self] (result, status) in
            
            if let result = result as? Data {
                do {
                    let response = try JSONDecoder().decode(MoviesList.self, from: result)
                    self?.presenter.presentMovies(response)
                } catch {
                    print(error)
                    self?.presenter.presentError(error.localizedDescription)
                }
            }
            
        }
    }
    
}
