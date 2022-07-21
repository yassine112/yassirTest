//
//  ViewController.swift
//  MoviesInfo
//
//  Created by YEH on 20/7/2022.
//

import UIKit

protocol MoviesListDisplayLogic: AnyObject {
    func displayMoviesList(_ movies: [ResponseItem])
    func displayError(_ message: String)
}

class MoviesListViewController: UIViewController, MoviesListDisplayLogic, Storyboarded {

    var coordinator: Coordinator?
    var interactor: MoviesListBusinessLogic?
    
    var movies: [ResponseItem]?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Movies List"
        tableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
        
        interactor?.getMoviesList()
    }
    
    // MARK: Display Logic
    
    func displayMoviesList(_ movies: [ResponseItem]) {
        self.movies = movies
        tableView.reloadData()
    }
    
    func displayError(_ message: String) {
        print(message)
    }

}

extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell
        cell?.fill(using: movies?[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (coordinator as? MainCoordinator)?.displayDetail(using: "")
    }
    
}
