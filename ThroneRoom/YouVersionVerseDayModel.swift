//
//  YouVersionVerseDayModel.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

struct YouVersionVerseDayModel: Codable {
    let day: Int
    let verse: VerseWrapper
    let image: ImageWrapper
}

struct VerseWrapper: Codable {
    let text: String
    let url: String
    let human_reference: String
}

struct ImageWrapper: Codable {
    let url: String
    let attribution: String
}
