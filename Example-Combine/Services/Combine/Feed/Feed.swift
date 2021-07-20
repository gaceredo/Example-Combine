//
//  Feed.swift
//  Example-Combine
//
//  Created by Luis Aceredo on 19/7/21.
//

import Foundation

enum Feed {
    case example_post
    case example_get
}

extension Feed: Endpoint {
    
    var httpMethod: RequestMethod {
        switch self {
        case .example_post:
            return .POST
        case .example_get:
            return .GET
        }
        
    }
    var path: String {
        switch self {
        case .example_post:
            return ""
        case .example_get:
            return ""
        }
    }
}
