//
//  InteractorDependencies.swift
//  Example-Combine
//
//  Created by Luis Aceredo on 19/7/21.
//
import Foundation
import Combine

class InteractorDependencies: RequestProtocol {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getFeed(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher< Model, Error> {
        execute(feedKind.request(query: query), decodingType: Model.self, retries: 1)
    }
    
    func postFeed(_ feedKind: Feed, body: [String: Any]) -> AnyPublisher< Model, Error> {
        return execute(feedKind.request(body: body), decodingType: Model.self, retries: 1)
    }
}
