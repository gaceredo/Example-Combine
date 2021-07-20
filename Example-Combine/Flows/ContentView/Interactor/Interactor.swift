//
//  Interactor.swift
//  Example-Combine
//
//  Created by Luis Aceredo on 19/7/21.
//

import Foundation
import Combine

protocol InteractorProtocol {
    func request(query: [URLQueryItem],completion: @escaping (Result< Model, Error>) -> Void)
    func request(body: [String : Any], completion: @escaping (Result< Model, Error>) -> Void)
}

final class Interactor: InteractorProtocol {
    
    private let dependencies: InteractorDependencies
    private var cancellable: AnyCancellable?
    
    init(dependencies: InteractorDependencies) {
        self.dependencies = dependencies
    }
    
    func request(query: [URLQueryItem],completion: @escaping (Result<Model, Error>) -> Void) {
        cancellable = dependencies.getFeed(query: query, .example_get)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished : break
                case .failure(let error):
                    completion(.failure(error))
                }
            },
            receiveValue: {
                completion(.success($0))
            })
    }
    
    func request(body: [String : Any], completion:@escaping (Result< Model, Error>) -> Void) {
        cancellable = dependencies.postFeed(.example_post, body: body)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished : break
                case .failure(let error):
                    completion(.failure(error))
                }
            },
            receiveValue: {
                completion(.success($0))
            })
    }
}
