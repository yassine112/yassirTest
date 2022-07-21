//
//  Configuration.swift
//  MoviesInfo
//
//  Created by Yassine EL HALAOUI on 20/7/2022.
//

import Foundation
import Alamofire

class NetworkConfig {
    
    static let shared = NetworkConfig()
    
    let apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
    
    var webServices = [String: Any]()
    private let baseUrl = "https://api.themoviedb.org/3/"
    
    init() {
        addWebService("movies_list", url: "discover/movie", method: .get)
        addWebService("movie_detail", url: "movie/%@", method: .get, withQueryParams: true)
        // add more endpoints
        
    }
    
    private func addWebService(_ name: String, url: String, method: HTTPMethod, withQueryParams: Bool = false) {
        var dic = [String: Any]()
        
        dic["ws_url"]       = "\(baseUrl)\(url)\(withQueryParams ? "?" : "")"
        dic["ws_method"]    = method
        
        webServices[name]   = dic
    }
}
