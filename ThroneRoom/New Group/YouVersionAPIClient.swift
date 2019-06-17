//
//  YouVersionAPIClient.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//
import Foundation

//final class YouVersionAPIClient {
//    static func getVerseOfDay(dayID: String, completionHandler: @escaping ((AppError?, String?) -> Void)) {
//        //TODO: interpolate current date in dayID
//        let URL = "https://developers.youversionapi.com/1.0/verse_of_the_day/\(dayID)?version_id=1"
//        
//        
//        NetworkHelper.shared.performDataTask(endpointURLString: URL, httpMethod: "GET", httpBody: nil) { (appError, data) in
//            if let error = appError {
//                completionHandler(error, nil)
//            }
//            if let data = data {
//                do {
//                    let bibleVerseData = try JSONDecoder().decode( YouVersionVerseDayModel.self, from: data)
//                    if let safeImage = bibleVerseData.image.url.first {
//                        let imageLink = safeImage.self
//                        completionHandler(nil, imageLink)
//                    }
//                } catch {
//                    completionHandler(AppError.jsonDecodingError(error), nil)
//                }
//            }
//        }
//    }
//}
