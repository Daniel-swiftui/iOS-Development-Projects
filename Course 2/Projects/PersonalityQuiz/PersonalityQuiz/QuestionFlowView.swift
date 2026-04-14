//
//  QuestionFlowView.swift
//  PersonalityQuiz
//
//  Created by Daniel Umpierrez on 3/5/26.
//

import SwiftUI

struct QuestionFlowView: View {
    @Environment(QuizManager.self) var quizManager
    let question: Question
    
    let questionIndex: Int
    
    var body: some View {
        VStack {
            switch question.type {
            case .single:
                SingleResponseSubview(viewModel: SingleResponseViewModel(question: question))
            case .multiple:
                MultipleResponseSubview(question: question)
            case .ranged:
                RangedResponseSubview(viewModel: RangedResponseViewModel(question: question))
            }
        }
        .toolbar {
                    if questionIndex + 1 < quizManager.questionList.count {
                        NavigationLink(
                            destination: QuestionFlowView(
                                question: quizManager.questionList[questionIndex + 1],
                                questionIndex: questionIndex + 1
                            )
                            .environment(quizManager)
                        ) {
                            Text("Next")
                        }
                    } else {
                        NavigationLink {
                            ResultsView()
                        } label: {
                            Text("Done")
                        }
                    }
                }
    }
}

#Preview {
    QuestionFlowView(
        question: Question(
            text: "What's your ideal workday like?",
            type: .single,
            answers: [
                Answer(text: "Making everyone laugh", type: .michael, questionIndex: 0),
                Answer(text: "Getting as much work done as possible", type: .dwight,questionIndex: 0),
                Answer(text: "Chatting with coworkers", type: .jim, questionIndex: 0),
                Answer(text: "Daydreaming", type: .pam,questionIndex: 0)
            ]
        ),
        questionIndex: 0
    )
    .environment(QuizManager())
}
