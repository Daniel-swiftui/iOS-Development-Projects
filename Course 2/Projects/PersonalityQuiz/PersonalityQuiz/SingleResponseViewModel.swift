//
//  SingleResponseViewModel.swift
//  PersonalityQuiz
//
//  Created by Daniel Umpierrez on 3/13/26.
//

import Foundation

@Observable class SingleResponseViewModel {
    var selectedChoice: Int = 0
    
    var quizManager: QuizManager? = nil
    let question: Question
    
    init(question: Question) {
        self.question = question
    }
    
    func updateAnswer() {
        let answer = question.answers[selectedChoice]
        quizManager?.selectAnswer(question: question, selectedAnswer: answer)
    }

}
