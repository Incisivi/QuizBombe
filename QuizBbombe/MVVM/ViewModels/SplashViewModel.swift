//
//  SplashViewModel.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 03.12.24.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var isSplashActive: Bool = true
    // Init ist nötig da es dadurch erst gecallt wird wenn eine instanz erstellt wird.
    init() {
        // blendet nach 3 sek aus
        // wird im maintreadh ausgeführt
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isSplashActive = false
        }
        //alternativ wäre es auch möglich .onAppear zu nutzen aber so ist die logik gekapselt.
    }
}
