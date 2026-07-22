//
//  ContentView.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/10/26.
//

import SwiftUI

struct LoginScreen: View {
    @Environment(AppState.self) var appState
    
    @State private var email = ""
    @State private var password = ""
    
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
                    TextField("Email", text: $email)
                        .inputFieldStyle
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .onChange(of: email) {
                            appState.loginErrorMessage = nil
                        }
                    SecureField("Password", text: $password)
                        .inputFieldStyle
                    
                    Button {
                        Task {
                            await appState.login(email: email, password: password)
                        }
                        
                    }label: {
                        Text("Login")
                    }
                    .buttonStyle(LoginButtonStyle(isError: appState.loginErrorMessage != nil))
                    .animation(.easeInOut(duration: 0.2), value: appState.loginErrorMessage)
                    .modifier(ShakeEffect(animatableData: CGFloat(appState.loginShakeTrigger)))
                    .animation(.spring(response: 0.3, dampingFraction: 0.4), value: appState.loginShakeTrigger)
                    
                    Text(appState.loginErrorMessage ?? " ")
                        .foregroundStyle(.yellow)
                        .font(.footnote)
                        .opacity(appState.loginErrorMessage == nil ? 0 : 1)
                    
                }
            }
            .padding(.horizontal, 50)
        }
    }
}

