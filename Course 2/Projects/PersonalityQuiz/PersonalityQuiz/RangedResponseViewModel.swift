//
//  RangedResponseViewModel.swift
//  PersonalityQuiz
//
//  Created by Daniel Umpierrez on 3/13/26.
//

import Foundation

@Observable class RangedResponseViewModel {
    var value: Double = 0
    
    var quizManager: QuizManager? = nil
    let question: Question
    
    init(question: Question) {
        self.question = question
    }
    
    
    func updateAnswer() {
        let answer = question.answers[Int(value)]
        quizManager?.selectAnswer(question: question, selectedAnswer: answer)
    }
}
