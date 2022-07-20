//
//  MainCoordinator.swift
//  MoviesInfo
//
//  Created by YEH on 20/7/2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MoviesListViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func displayDetail(using movieID: String) {
        let vc = MovieDetailViewController.instantiate()
        vc.coordinator = self
        vc.movieID = movieID
        navigationController.pushViewController(vc, animated: true)
    }
    
}
