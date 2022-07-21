//
//  NetworkManagerProtocol.swift
//  MoviesInfo
//
//  Created by Yassine EL HALAOUI on 21/7/2022.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    typealias CompletionType = (Any?, Int) -> Void
    
    func makeRequest(ws: String, path: String?, query: [String: Any]?, params: Parameters?, _ completion: @escaping CompletionType)
}
