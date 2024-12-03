//
//  APICallTest.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 03.12.24.
//

//import SwiftUI
//
//struct APICallTest: View {
//
//    @StateObject private var quizModel = QAViewModel()
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                if !quizModel.quizzes.isEmpty {
//                    List(quizModel.quizzes) { quiz in
//                        VStack(alignment: .leading) {
//                            Text(quiz.question)
//                                .font(.headline)
//                                .padding(.bottom, 5)
//
//                            Text("Antworten: \(quiz.togetherAnswers.joined(separator: ", "))")
//                                .padding(.top, 5)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Quiz API")
//        }
//        .onAppear {
//            quizModel.fetchQuiz()
//        }
//    }
//}
//
//#Preview {
//    APICallTest()
//}import SwiftUI
