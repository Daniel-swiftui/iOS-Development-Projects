//
//  QuizManager.swift
//  PersonalityQuiz
//
//  Created by Daniel Umpierrez on 3/5/26.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}
enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: OfficeCharacter
    var questionIndex: Int
    
}
enum OfficeCharacter {
    case michael, dwight, jim, pam, stanley, kelly, angela, kevin
}


@Observable class QuizManager {
    let questionList: [Question] = [
        Question(
            text: "What's your ideal workday like?",
            type: .single,
            answers: [
                Answer(text: "Making everyone laugh", type: .michael, questionIndex: 0),
                Answer(text: "Getting as much work done as possible", type: .dwight,questionIndex: 0),
                Answer(text: "Chatting with coworkers", type: .jim, questionIndex: 0),
                Answer(text: "Daydreaming", type: .pam,questionIndex: 0)
            ]
        ),
        Question(
            text: "How would coworkers describe you?",
            type: .multiple,
            answers: [
                Answer(text: "Funny", type: .michael,questionIndex: 1),
                Answer(text: "Competitive", type: .dwight,questionIndex: 1),
                Answer(text: "Friendly", type: .pam,questionIndex: 1),
                Answer(text: "Dramatic", type: .kelly,questionIndex: 1)
            ]
        ),
        Question(
            text: "How much do you enjoy being the center of attention?",
            type: .ranged,
            answers: [
                Answer(text: "Don't like it", type: .stanley,questionIndex: 2),
                Answer(text: "Kinda like it", type: .pam,questionIndex: 2),
                Answer(text: "Like it", type: .jim,questionIndex: 2),
                Answer(text: "Really like it", type: .michael,questionIndex: 2)
                
            ]
        ),
        Question(
            text: "Which office activity sounds the most fun?",
            type: .single,
            answers: [
                Answer(text: "Office Olympics", type: .jim, questionIndex: 3),
                Answer(text: "A motivational speech from the boss", type: .michael, questionIndex: 3),
                Answer(text: "Organizing supplies", type: .angela, questionIndex: 3),
                Answer(text: "Eating snacks in the break room", type: .kevin, questionIndex: 3)
            ]
        ),
        Question(
            text: "Pick the traits that describe you:",
            type: .multiple,
            answers: [
                Answer(text: "Hard-working", type: .dwight, questionIndex: 4),
                Answer(text: "Creative", type: .pam, questionIndex: 4),
                Answer(text: "Sarcastic", type: .jim, questionIndex: 4),
                Answer(text: "Loves gossip", type: .kelly, questionIndex: 4)
            ]
        )
    ]
    
    //String is the question text
    private var selectedAnswers: [String : [Answer]] = [:] {
        didSet {
            let answers = selectedAnswers.values.map { $0.map({ $0.text }).joined(separator: ", ") }
            print("Current Answers: \(answers)")
        }
    }
    
    func selectAnswer(question: Question, selectedAnswer: Answer) {
        selectedAnswers[question.text] = [selectedAnswer]
    }
    func selectAnswers(question: Question, selectedAnswers: [Answer]) {
        self.selectedAnswers[question.text] = selectedAnswers
    }
    
    func calculateResult(_ answers: [Answer]) -> String {
        var frequency: [OfficeCharacter : Int] = [:]
        for answer in answers {
            frequency[answer.type, default: 0] += 1
        }
        
        let mostCommon = frequency.max { $0.value < $1.value }?.key
        
        switch mostCommon {
        case .michael:
            return "Michael Scott \n"
        case .dwight:
            return "Dwight Schrute \n"
        case .jim:
            return "Jim Halpert \n"
        case .pam:
            return "Pam Beesly \n"
        case .stanley:
            return "Stanley Hudson \n"
        case .kelly:
            return "Kelly Kapoor \n"
        case .angela:
            return "Angela Martin \n"
        case .kevin:
            return "Kevin Malone \n"
        case .none:
            return "nothing"
        }
    }
    
    func getAllSelectedAnswers() -> [Answer] {
        return selectedAnswers.values.flatMap { $0 }
    }
    
}
