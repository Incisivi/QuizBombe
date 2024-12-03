//
//  QuizModel.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 02.12.24.
//

import Foundation

struct QuizModel: Identifiable, Codable {
    var id = UUID()
    var type: String
    var difficulty: String
    var category: String
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case type
        case difficulty
        case category
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
    var togetherAnswers: [String] {
           var allAnswers = incorrectAnswers
           allAnswers.append(correctAnswer)
           allAnswers.shuffle()
           return allAnswers
       }

    func isCorrectAnswer(selectedAnswer: String) -> Bool {
        return selectedAnswer == correctAnswer
    }
}
