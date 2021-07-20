//
//  Endpoint.swift
//  Example-Combine
//
//  Created by Luis Aceredo on 19/7/21.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    var httpMethod: RequestMethod { get }
}

extension Endpoint {
    
    var headers: [String: String] {
        return [ "x-access-token": "TOKEN",
                 "content-type": "application/json"]
    }
    
    var base : String {
        if AppConfig.environment == .Development {
            return "url-dev"
        } else {
            return "url-prod"
        }
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
    
    func request(query items: [URLQueryItem]) -> URLRequest {
        var url = urlComponents
        url.queryItems = items
        var request = URLRequest(url: url.url!)
        request.allHTTPHeaderFields = headers
        return request
    }
    
    func request(body: [String: Any] ) -> URLRequest {
        
        let data = try! JSONSerialization.data(withJSONObject: body)
        var url = URLRequest(url: urlComponents.url!)
        url.httpBody = data
        url.allHTTPHeaderFields = headers
        url.httpMethod = httpMethod.value
        return url
    }
}
