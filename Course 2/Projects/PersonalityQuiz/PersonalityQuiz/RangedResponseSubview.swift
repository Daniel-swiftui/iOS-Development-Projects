//
//  RangedResponseSubview.swift
//  PersonalityQuiz
//
//  Created by Daniel Umpierrez on 3/5/26.
//

import SwiftUI

struct RangedResponseSubview: View {
    @Environment(QuizManager.self) var quizManager
   
    @State var viewModel: RangedResponseViewModel
    var body: some View {
        ZStack {
            Color(hue: 0.5, saturation: 0.5, brightness: 0.9, opacity: 0.5)
                .ignoresSafeArea()
            VStack {
                Text(viewModel.question.text)
                
                Slider(value: $viewModel.value, in: 0...Double(viewModel.question.answers.count - 1), step: 1) {
                }
                .padding(.horizontal, 15)
                .font(.custom("American Typewriter", size: 10))
                HStack(spacing:30) {
                    ForEach(0..<viewModel.question.answers.count, id: \.self) { index in
                        Text(viewModel.question.answers[index].text)
                            .frame(width: 70)
                    }
                }
            }
            .font(.custom("American Typewriter", size: 20))
            .padding()
            .onChange(of: viewModel.value) {
                viewModel.updateAnswer()
            }
            .onAppear {
                viewModel.quizManager = quizManager
                viewModel.updateAnswer()
            }
        }
    }
    
}

#Preview {
    RangedResponseSubview(viewModel: RangedResponseViewModel(
        question: Question(
            text: "How much do you enjoy being the center of attention?",
            type: .ranged,
            answers: [
                Answer(text: "Don't like it", type: .stanley,questionIndex: 0),
                Answer(text: "Kinda like it", type: .pam,questionIndex: 0),
                Answer(text: "Like it", type: .jim,questionIndex: 0),
                Answer(text: "Really like it", type: .michael,questionIndex: 0)
            ]
        ), 
        )
    )
    
}
