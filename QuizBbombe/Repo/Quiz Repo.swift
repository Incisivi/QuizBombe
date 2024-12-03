//
//  Quiz Repo.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 02.12.24.
//

import Foundation

// Repository, das die API-Daten abruft
class QuizRepository {
    private let apiURL = "https://opentdb.com/api.php?amount=10&type=multiple"

    // Methode, die Quizfragen von der API abruft
    func getQuizzesFromAPI() async throws -> APIResponse {
        guard let url = URL(string: apiURL) else {
            throw HTTPError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        
        do {
            let response = try decoder.decode(APIResponse.self, from: data)
            return response
        } catch {
            throw HTTPError.fetchFailed
        }
    }
}
