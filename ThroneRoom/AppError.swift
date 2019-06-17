//
//  AppError.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation
enum AppError: Error {
    case badURL(String)
    case jsonDecodingError(Error)
    case networkError(Error)
    case badStatusCode(String)
    case propertyListEncodingError(Error)
    
    public func errorMessage() -> String {
        switch self {
        case .badURL(let message):
            return "bad url: \(message)"
        case .jsonDecodingError(let error):
            return "json decoding error: \(error)"
        case .networkError(let error):
            return "network error: \(error)"
        case .badStatusCode(let message):
            return "bad status code: \(message)"
        case .propertyListEncodingError(let error):
            return "property list encoding error: \(error)"
        }
    }
}
