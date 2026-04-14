//
//  ResultsView.swift
//  PersonalityQuiz
//
//  Created by Daniel Umpierrez on 3/5/26.
//

import SwiftUI

struct ResultsView: View {
    
    @Environment(QuizManager.self) var quizManager
    @State private var resultText: String = ""
    
    var body: some View {
        ZStack {
            Color(hue: 0.5, saturation: 0.5, brightness: 0.9, opacity: 0.5)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Your office character is:")
                    .font(.custom("American Typewriter", size: 45))
                
                Text(resultText)
                    .font(.custom("American Typewriter", size: 45))
                    .bold()
            }
            .onAppear {
                let answers = quizManager.getAllSelectedAnswers()
                resultText = quizManager.calculateResult(answers)
                
                Task {
                    try? await Task.sleep(for: .seconds(7))
                    SoundManager.instance.stopSound(sound: .theOffice2)
                }
            }
        }
    }
}

#Preview {
    ResultsView()
}
