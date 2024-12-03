//
//  GameViewModel.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 03.12.24.
//
//  UserViewModel.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 02.12.24.
//
//  GameViewModel.swift
//  QuizBbombe
//
//  Created by Noah Ra on 02.12.24.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var quizzes: [QuizModel] = []  // Die Fragen
    @Published var currentQuestionIndex: Int = 0  // Der Index der aktuellen Frage
    @Published var playerScore: Int = 0  // Die Punktzahl des Spielers
    @Published var gameEnded: Bool = false  // Status, ob das Spiel beendet ist
    @Published var selectedAnswer: String? = nil  // Die Antwort des Spielers
    
    
    func fetchQuiz() {
        self.quizzes = [
            QuizModel(type: "multiple", difficulty: "easy", category: "General Knowledge", question: "Was ist die Hauptstadt von Deutschland?", correctAnswer: "Berlin", incorrectAnswers: ["Paris", "London", "Madrid"]),
            QuizModel(type: "multiple", difficulty: "easy", category: "General Knowledge", question: "Wer ist der Erfinder des iPhones?", correctAnswer: "Steve Jobs", incorrectAnswers: ["Bill Gates", "Elon Musk", "Mark Zuckerberg"])
        ]
    }
    
    func checkAnswer() {
        guard let selectedAnswer = selectedAnswer else { return }
        
        let currentQuestion = quizzes[currentQuestionIndex]
        
        if currentQuestion.isCorrectAnswer(selectedAnswer: selectedAnswer) {
            playerScore += 1000  // 1000 Punkte pro richtiger Antwort
        }
        
        if currentQuestionIndex + 1 < quizzes.count {
            currentQuestionIndex += 1
        } else {
            gameEnded = true
        }
    }
}//
