//
//  NetworkManager.swift
//  MoviesInfo
//
//  Created by Yassine EL HALAOUI on 20/7/2022.
//

import Foundation
import Alamofire

class NetworkManager: NetworkManagerProtocol {
    
    func makeRequest(ws: String, path: String? = nil, query: [String: Any]? = nil, params: Parameters? = nil, _ completion: @escaping CompletionType) {
        let dic = NetworkConfig.shared.webServices[ws] as! [String: Any]
        
        let urlString = createUrl(dic["ws_url"] as! String, path: path, query: query)
        let method = dic["ws_method"] as! HTTPMethod
        print("\(method.rawValue) - \(urlString)")
        guard let url = URL(string: urlString) else { return }
        
        let headers: HTTPHeaders = [
            .accept("application/json"),
            .contentType("application/json")
        ]

        print(params ?? "N/D")
        AF.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200...499)
            .responseJSON { (response) in
                
            print(response.response?.statusCode ?? -1)
            
            switch (response.result) {
                case .failure(let err):
                    print(err.errorDescription ?? "Request error")
                    completion(nil, response.response?.statusCode ?? -1)
                case .success(let json):
                    print("data: ", json)
                    completion(response.data, response.response?.statusCode ?? -1)
            }
            
        }
    }
    
    private func createUrl(_ baseUrl: String, path pathParam: String? = nil, query queryParams: [String: Any]? = nil) -> String {
        var url = ""
        
        // Add path param
        if let path = pathParam { url = String(format: baseUrl, path) } else { url = baseUrl }
        
        // add query params
        if let query = queryParams {
            for (key,value) in query {
                url = "\(url)\(key)=\(value)&"
            }
            url.removeLast()
        }
        
        return url
    }
}
