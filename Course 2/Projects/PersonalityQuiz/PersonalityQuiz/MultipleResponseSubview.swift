//
//  MultipleResponseSubview.swift
//  PersonalityQuiz
//
//  Created by Daniel Umpierrez on 3/5/26.
//

import SwiftUI

struct MultipleResponseSubview: View {
    @Environment(QuizManager.self) var quizManager
    let question: Question
    @State private var answer1: Bool = false
    @State private var answer2: Bool = false
    @State private var answer3: Bool = false
    @State private var answer4: Bool = false
    var body: some View {
        ZStack {
            Color(hue: 0.5, saturation: 0.5, brightness: 0.9, opacity: 0.5)
                .ignoresSafeArea()
            VStack {
                Text(question.text)
                    .padding()
                Toggle(question.answers[0].text, isOn: $answer1)
                Toggle(question.answers[1].text, isOn: $answer2)
                Toggle(question.answers[2].text, isOn: $answer3)
                Toggle(question.answers[3].text, isOn: $answer4)
            }
            .toggleStyle(SwitchToggleStyle(tint: .blue))
            .padding(.horizontal, 40)
            .font(.custom("American Typewriter", size: 20))
            .onAppear {
                updateAnswers()
            }
            .onChange(of: answer1) {
                updateAnswers()
            }
            .onChange(of: answer2) {
               updateAnswers()
            }
            .onChange(of: answer3) {
               updateAnswers()
            }
            .onChange(of: answer4) {
                updateAnswers()
            }
            
        }
    }
    
    func updateAnswers () {
        var answers = [Answer]()
        if answer1 {
            answers.append(question.answers[0])
        }
        if answer2 {
            answers.append(question.answers[1])
        }
        if answer3 {
            answers.append(question.answers[2])
        }
        if answer4 {
            answers.append(question.answers[3])
        }
        
        quizManager.selectAnswers(question: question, selectedAnswers: answers)
    }
}


#Preview {
    MultipleResponseSubview(
        question:Question(
            text: "How would coworkers describe you?",
            type: .multiple,
            answers: [
                Answer(text: "Funny", type: .michael,questionIndex: 0),
                Answer(text: "Competitive", type: .dwight,questionIndex: 0),
                Answer(text: "Friendly", type: .pam,questionIndex: 0),
                Answer(text: "Dramatic", type: .kelly,questionIndex: 0)
            ]
        )
    )
  
}
