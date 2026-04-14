//
//  PersonalityQuizApp.swift
//  PersonalityQuiz
//
//  Created by Daniel Umpierrez on 3/5/26.
//

import SwiftUI

@main
struct PersonalityQuizApp: App {
    
    @State private var quizManager = QuizManager()
    
    var body: some Scene {
        WindowGroup {
            TitleView()
                .environment(quizManager)
        }
    }
}
