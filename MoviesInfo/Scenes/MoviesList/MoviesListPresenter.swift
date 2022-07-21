//
//  MoviesListPresenter.swift
//  MoviesInfo
//
//  Created by Yassine EL HALAOUI on 21/7/2022.
//

import Foundation

protocol MoviesListPresentationLogic {
    func presentMovies(_ list: MoviesList)
    func presentError(_ message: String)
}

class MoviesListPresenter: MoviesListPresentationLogic {
    
    weak var viewController: MoviesListDisplayLogic!
    
    init(_ viewController: MoviesListDisplayLogic) {
        self.viewController = viewController
    }
    
    func presentMovies(_ list: MoviesList) {
        self.viewController.displayMoviesList(list.results ?? [])
    }
    
    func presentError(_ message: String) {
        self.presentError(message)
    }
    
    
}
