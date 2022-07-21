//
//  Configuration.swift
//  MoviesInfo
//
//  Created by YEH on 20/7/2022.
//

import Foundation

class Configuration {
    
    static let apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
    static let shared = Configuration()
    
    var webServices = [String: Any]()
    private let baseUrl = "https://api.themoviedb.org/3/movie/"
    
    init() {
        addWebService(Constants.WS_LOGIN, url: "login", method: .post, needAuth: false)
        
        
    }
    
    private func addWebService(_ name: String, url: String, method: HttpMethod, withQueryParams: Bool = false) {
        var dic = [String: Any]()
        
        dic["ws_url"]       = "\(baseUrl)\(url)\(withQueryParams ? "?" : "")"
        dic["ws_method"]    = method
        dic["ws_auth"]      = needAuth
        
        webServices[name]   = dic
    }
}
