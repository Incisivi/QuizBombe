//
//  SplashScreenView.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 03.12.24.
//

import SwiftUI

struct SplashScreenView: View {
    @ObservedObject var viewModel: SplashViewModel

    var body: some View {
        ZStack {
            Image("splash") 
                .resizable()
            //nicht optimal funktioniert aber, durch scaledToFill wird das künstlich hochskaliert
                .scaledToFill()
                .frame(width: .infinity, height: .infinity)
            //smoothe ausblende animation
                .opacity(viewModel.isSplashActive ? 1.0 : 0.0)
                .animation(.easeIn(duration: 2.0), value: viewModel.isSplashActive)
                .ignoresSafeArea()

            Text("Bomben Stimmung mit QuizBomb")
                .foregroundStyle(.white)
                .opacity(viewModel.isSplashActive ? 1.0 : 0.0)
                
        }
    }
}


//#Preview {SplashScreenView()}
