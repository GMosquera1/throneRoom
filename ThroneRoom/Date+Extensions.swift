//
//  Date+Extensions.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 8/1/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation
import Firebase
extension Date {
    static func getISOTimestamp() -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        let timestamp = isoDateFormatter.string(from: Date())
        return timestamp
    }
}
extension Timestamp{
    
}
