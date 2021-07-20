//
//  RequestMethod.swift
//  Example-Combine
//
//  Created by Luis Aceredo on 19/7/21.
//

import Foundation

enum RequestMethod: String {
    case POST = "POST"
    case DELETE = "DELETE"
    case GET = "GET"
    case PUT = "PUT"
    
    var value: String {
        return rawValue
    }
}
