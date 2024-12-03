//
//  GameView.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 03.12.24.
//
import SwiftUI

struct GameView: View {
    @StateObject private var gameViewModel = QAViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                // Ladeanzeige, während die Fragen geladen werden
                if gameViewModel.isLoading {
                    ProgressView("Fragen werden geladen...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
                // Spiel beendet
                else if gameViewModel.gameEnded {
                    endGameView
                }
                // Sicherstellen, dass das Quiz geladen ist und Fragen existieren
                else if !gameViewModel.quizzes.isEmpty {
                    quizView
                }
                // Falls keine Fragen geladen werden können
                else {
                    errorView
                }
            }
            .padding()
            .navigationTitle("Wer wird Millionär?")
            .onAppear {
                // Lade die Quiz-Daten
                Task {
                    await gameViewModel.fetchQuiz()
                }
            }
        }
    }


    
    // Ansichten
    private var endGameView: some View {
        VStack {
            Text("Spiel Beendet")
                .font(.largeTitle)
                .padding()
            Text("Deine Punktzahl: \(gameViewModel.playerScore)")
                .font(.title)
                .padding()
        }
    }

    private var quizView: some View {
        let currentQuiz = gameViewModel.quizzes[gameViewModel.currentQuestionIndex]
        
        return VStack {
            Text(currentQuiz.question)
                .font(.headline)
                .padding()

            // Antworten anzeigen
            ForEach(currentQuiz.togetherAnswers, id: \.self) { answer in
                Button(action: {
                    gameViewModel.selectedAnswer = answer
                }) {
                    Text(answer)
                        .padding()
                        .background(gameViewModel.selectedAnswer == answer ? Color.blue : Color.gray)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                .padding(2)
            }

            Button(action: {
                gameViewModel.checkAnswer()
            }) {
                Text("Antwort Überprüfen")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
            .padding(.top)

            Text("Punktzahl: \(gameViewModel.playerScore)")
                .padding(.top)
        }
    }

    private var errorView: some View {
        Text("Es gab ein Problem beim Laden der Fragen.")
            .foregroundColor(.red)
            .padding()
    }
}

#Preview {
    GameView()
}//
