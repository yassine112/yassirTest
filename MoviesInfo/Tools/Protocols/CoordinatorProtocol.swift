//
//  Coordinator_protocol.swift
//  MoviesInfo
//
//  Created by Yassine EL HALAOUI on 20/7/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
