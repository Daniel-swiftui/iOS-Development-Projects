//
//  MyModifier.swift
//  ViewModifierExamples
//
//  Created by Toby Youngberg on 9/15/25.
//

import SwiftUI

fileprivate struct MyModifier: ViewModifier {
    @State var isTapped = false
    
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 100, alignment: .center)
            .overlay(
              Text("Overlay")
                  .offset(x: 20 ,y: 60)
                  .opacity(isTapped ? 1 : 0)
            )
            .onTapGesture {
                isTapped.toggle()
            }
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

extension View {
    func myModifier() -> some View {
        self
            .modifier(MyModifier())
    }
}

extension View {
    func myModifier2() -> some View {
        self
            .frame(width: 300, height: 100, alignment: .center)
            .overlay(
              Text("Overlay")
                .frame(width: 200)
                .background(.red)
                .cornerRadius(15)
                .offset(x: 20 ,y: 40)
            )
            .font(.custom("Times New Roman", size: 50))
    }
}

struct MyView1: View {
    var body: some View {
        Text("Hello, World!")
            .myModifier()
    }
}

struct MyView2: View {
    var body: some View {
        Text("Hello, Daniel!")
            .myModifier2()
    }
}

#Preview {
    MyView1()
}

#Preview {
    MyView2()
}
