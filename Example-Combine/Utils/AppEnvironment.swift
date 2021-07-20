//
//  AppEnvironment.swift
//  Example-Combine
//
//  Created by Luis Aceredo on 19/7/21.
//

import Foundation

enum AppEnvironment {
    case Development
    case Release
}

struct AppConfig {
    static var environment : AppEnvironment {
        #if DEBUG
          return .Development
        #else
          return .Release
        #endif
    }
    
}
