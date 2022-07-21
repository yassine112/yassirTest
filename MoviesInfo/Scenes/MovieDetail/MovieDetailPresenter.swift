//
//  MovieDetailPresenter.swift
//  MoviesInfo
//
//  Created by Yassine EL HALAOUI on 21/7/2022.
//

import Foundation

protocol MovieDetailPresentationLogic {
    func presentMovieDetail(_ movie: Movie)
    func presentError(_ message: String)
}

class MovieDetailPresenter: MovieDetailPresentationLogic {
    
    weak var viewController: MovieDetailDisplayLogic!
    
    init(_ viewController: MovieDetailDisplayLogic) {
        self.viewController = viewController
    }
    
    func presentMovieDetail(_ movie: Movie) {
        viewController.displayMovieDetail(movie)
    }
    
    func presentError(_ message: String) {
        viewController.displayError(message)
    }
}
