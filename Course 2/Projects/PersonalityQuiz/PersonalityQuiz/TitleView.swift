//
//  ContentView.swift
//  PersonalityQuiz
//
//  Created by Daniel Umpierrez on 3/5/26.
//

import SwiftUI

struct TitleView: View {
    @State var quizManager: QuizManager = QuizManager()
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hue: 0.5, saturation: 0.5, brightness: 0.9, opacity: 0.5)
                    .ignoresSafeArea()
                VStack (){
                    Text("Which Office Character Are You?")
                        .font(.custom("American Typewriter", size: 45))
                        .foregroundStyle(Color(hue: 0.6, saturation: 0.9, brightness: 0.6))
                        .fontWeight(.medium)
                        .padding(.vertical,30)
                    Image("TheOffice")
                        .resizable()
                        .frame(width: 225, height: 250)
                        .shadow(radius: 5, x: -5, y: 5)
                        .padding(.vertical,50)
                    NavigationLink {
                        QuestionFlowView(question: quizManager.questionList[0], questionIndex: 0)
                    } label: {
                        Text("Tap To Begin")
                            .font(.custom("American Typewriter", size: 30))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.blue)
                            )
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                    }
                    .onDisappear {
                        SoundManager.instance.playSound(sound: .theOffice2)
                    }
                }
            }
        }
    }
}

#Preview {
    TitleView()
       
}
