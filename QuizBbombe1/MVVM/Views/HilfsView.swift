//
//  HilfsView.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 03.12.24.
//

import SwiftUI

struct HilfsView: View {
    @StateObject var splashViewModel = SplashViewModel()
    var body: some View {
       
        
        if splashViewModel.isSplashActive {
            SplashScreenView(viewModel: splashViewModel)
        } else {
            MainView() // Ersetze durch deine Hauptansicht
        }
    }
}
//#Preview {
//    HilfsView()
//}
