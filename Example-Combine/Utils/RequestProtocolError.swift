//
//  RequestProtocolError.swift
//  Example-Combine
//
//  Created by Luis Aceredo on 19/7/21.
//

import Foundation

enum RequestProtocolError: Error {
    case custon(errror: String)
}

extension RequestProtocolError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .custon(let error):
            let format = NSLocalizedString( error, comment: "" )
            return String(format: format, String(error))
        }
    }
}
