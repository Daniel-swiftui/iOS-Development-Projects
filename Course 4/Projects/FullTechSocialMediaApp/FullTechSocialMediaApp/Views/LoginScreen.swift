//
//  ContentView.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/10/26.
//

import SwiftUI

struct LoginScreen: View {
    @Binding var isLoggedIn: Bool
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        ZStack {
            LinearGradient.backgroundGradientLight
                .ignoresSafeArea()
            VStack (spacing: 50) {
                VStack {
                    Text("Welcome")
                        .font(.custom("Futura", size: 50))
                        .foregroundStyle(Color.white)
                        .bold()
                    Text("Login to your account")
                        .font(.custom("Futura", size: 12))
                        .foregroundStyle(Color.white)
                        .bold()
                }
                VStack{
                    TextField("Username", text: $username, prompt: Text("Username"))
                        .inputFieldStyle
                    SecureField("Password", text: $password, prompt: Text("Password"))
                        .inputFieldStyle
                    Button {
                        withAnimation(.snappy) {
                            isLoggedIn = true
                        }
                    }label: {
                        Text("Login")
                    }
                    .buttonStyle(LoginButtonStyle())
                }
            }
            .padding(.horizontal, 50)
        }
    }
}

#Preview {
    @Previewable @State var isLoggedIn = false

    LoginScreen(isLoggedIn: $isLoggedIn)
}
