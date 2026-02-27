//
//  ContentView.swift
//  ViewModifierExamples
//
//  Created by Toby Youngberg on 8/27/25.
//

import SwiftUI

struct MyView: View {
  var body: some View {
      Text("Hello World")
          .frame(width: 300, height: 100, alignment: .center)
          .overlay(
            Text("Overlay")
                .offset(x: 20 ,y: 60)
                .hidden()
          )
          .font(.custom("Times New Roman", size: 50))
          .bold()
          .italic()
          .strikethrough(color: .gray)
          .underline(color: .yellow)
          .border(.red, width: 4)
          .tint(.green)//Can't tell what this is doing
          .position(x: 200, y: 200 )
          .offset(x: 0 ,y: 0)
          .background(.mint)
          .padding()
  }
}

#Preview {
    MyView()
}
