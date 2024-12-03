//
//  HTTPError.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 03.12.24.
//

import Foundation

enum HTTPError: Error {
    case invalidURL, fetchFailed
    
    var message: String {
        switch self {
        case .invalidURL: "Something went wrong: BADURL"
        case .fetchFailed: "Something wrong went happen during loading your questions"
        }
    }
}
