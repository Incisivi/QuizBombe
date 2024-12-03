//
//  ViewModel Q&A.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 02.12.24.
//

//  ViewModel Q&A.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 02.12.24.
//

import Foundation

@MainActor
class QAViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var quizzes: [QuizModel] = []  // Die geladenen Fragen
    @Published var currentQuestionIndex: Int = 0  // Index der aktuellen Frage
    @Published var playerScore: Int = 0  // Die Punktzahl des Spielers
    @Published var gameEnded: Bool = false  // Status, ob das Spiel beendet ist
    @Published var selectedAnswer: String? = nil  // Die Antwort des Spielers
    
    private let repository = QuizRepository()

    // Die Quizfragen von der API laden
    func fetchQuiz() async {
        isLoading = true
        do {
            // Hole die Daten von der API
            let response = try await repository.getQuizzesFromAPI()
            self.quizzes = response.results // Setze die geladenen Fragen
        } catch let error as HTTPError {
            print("Fehler: \(error.message)")
        } catch {
            print("Unbekannter Fehler: \(error)")
        }
        isLoading = false
    }

    // Überprüfen, ob die Antwort richtig ist
    func checkAnswer() {
        guard let selectedAnswer = selectedAnswer else { return }
        let currentQuiz = quizzes[currentQuestionIndex]
        
        if currentQuiz.isCorrectAnswer(selectedAnswer: selectedAnswer) {
            playerScore += 1000  // 1000 Punkte pro richtige Antwort
        }
        
        // Gehe zur nächsten Frage oder beende das Spiel, wenn keine Fragen mehr da sind
        if currentQuestionIndex + 1 < quizzes.count {
            currentQuestionIndex += 1
        } else {
            gameEnded = true
        }
    }
}//
