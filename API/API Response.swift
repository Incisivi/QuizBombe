//
//  API Response.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 03.12.24.
//

//  UserModel.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 02.12.24.
//


//  QuizModel.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 02.12.24.
//


//
//  HTTPError.swift
//  QuizBbombe
//
//  Created by Noah Ra on 02.12.24.
//


//  APIResponse.swift
//  QuizBbombe
//
//  Created by Noah Ra on 02.12.24.
//

import Foundation

// API Response für die Fragen
struct APIResponse: Codable {
    var responseCode: Int  // Maps to response_code
    var results: [QuizModel]  // Array of quiz items

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}//
