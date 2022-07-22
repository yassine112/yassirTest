//
//  MovieDetailViewController.swift
//  MoviesInfo
//
//  Created by Yassine EL HALAOUI on 20/7/2022.
//

import UIKit
import Kingfisher

protocol MovieDetailDisplayLogic: AnyObject {
    func displayMovieDetail(_ movie: Movie)
    func displayError(_ message: String)
}

class MovieDetailViewController: UIViewController, MovieDetailDisplayLogic, Storyboarded {
    
    var coordinator: Coordinator?
    var interactor: MovieDetailBusinessLogic?
    var movieID: String?
    
    // MARK: Outlets
    @IBOutlet weak var movieImage       : UIImageView!
    @IBOutlet weak var movieTitle       : UILabel!
    @IBOutlet weak var movieReleaseDate : UILabel!
    @IBOutlet weak var movieDisc        : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.getMoviesDetail(using: movieID)
    }
    
    // MARK: Display Logic
    
    func displayMovieDetail(_ movie: Movie) {
        if let posterPath = movie.posterPath, let url = URL(string: "\(NetworkConfig.shared.imageBaseUrl)\(posterPath)") {
            movieImage.kf.setImage(with: url)
        }
        
        movieTitle.text = movie.title
        movieReleaseDate.text = movie.releaseDate
        movieDisc.text = movie.overview
    }
    
    func displayError(_ message: String) {
        print(message)
    }

}
