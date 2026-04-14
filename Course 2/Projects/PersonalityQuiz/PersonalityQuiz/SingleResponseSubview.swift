//
//  SingleResponseSubview.swift
//  PersonalityQuiz
//
//  Created by Daniel Umpierrez on 3/5/26.
//

import SwiftUI

struct SingleResponseSubview: View {
    @Environment(QuizManager.self) var quizManager
   
    @State var viewModel: SingleResponseViewModel
    
    var body: some View {
        ZStack {
            Color(hue: 0.5, saturation: 0.5, brightness: 0.9, opacity: 0.5)
                .ignoresSafeArea()
            VStack {
                Text(viewModel.question.text)
                
                Picker("Select an answer", selection: $viewModel.selectedChoice) {
                    ForEach(0..<viewModel.question.answers.count, id: \.self) { index in
                        Text(viewModel.question.answers[index].text)
                            .font(.custom("American Typewriter", size: 19))
                            .bold()
                            .tag(index)
                    }
                }
                .pickerStyle(.wheel)
                .onChange(of: viewModel.selectedChoice) {
                    viewModel.updateAnswer()
                }
                .onAppear {
                    viewModel.quizManager = quizManager
                    viewModel.updateAnswer()
                }
            }
            .font(.custom("American Typewriter", size: 20))
        }
    }
}

#Preview {
    SingleResponseSubview(viewModel: SingleResponseViewModel(
        
        question: Question(
            text: "What's your ideal workday like?",
            type: .single,
            answers: [
                Answer(text: "Making everyone laugh", type: .michael, questionIndex: 0),
                Answer(text: "Getting as much work done as possible", type: .dwight,questionIndex: 0),
                Answer(text: "Chatting with coworkers", type: .jim, questionIndex: 0),
                Answer(text: "Daydreaming", type: .pam,questionIndex: 0)
                
            ]
        )
        )
    )
}
