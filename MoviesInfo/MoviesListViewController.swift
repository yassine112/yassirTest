//
//  ViewController.swift
//  MoviesInfo
//
//  Created by YEH on 20/7/2022.
//

import UIKit

class MoviesListViewController: UIViewController, Storyboarded {
    
    var coordinator: Coordinator?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Movies List"
        tableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }


}

extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (coordinator as? MainCoordinator)?.displayDetail(using: "")
    }
    
}
