//
//  RequestProtocol.swift
//  Example-Combine
//
//  Created by Luis Aceredo on 19/7/21.
//

import Foundation
import Combine

protocol RequestProtocol {
    var session: URLSession { get }
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue,
                    retries: Int) -> AnyPublisher<T, Error> where T: Decodable
}

extension RequestProtocol {
    
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue = .main,
                    retries: Int = 0) -> AnyPublisher<T, Error> where T: Decodable {
        
        return session.dataTaskPublisher(for: request)
            .tryMap { (data, response) in

                guard let validate = response as? HTTPURLResponse, validate.statusCode == 200 else {
                    let decode = try? JSONDecoder().decode(RequestError.self, from: data)
                    let message = decode?.message ?? ""
                    throw RequestProtocolError.custon(errror: message)
                }

                return data
            }
            
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
        
    }
}

struct RequestError: Decodable {
     var success: Bool
     var message: String
}

