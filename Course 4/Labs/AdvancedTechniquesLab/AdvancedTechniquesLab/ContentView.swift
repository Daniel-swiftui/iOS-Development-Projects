//
//  ContentView.swift
//  AdvancedTechniquesLab
//
//  Created by Daniel Umpierrez on 5/15/26.
//

import SwiftUI

enum ViewState {
    case waiting
    case loading
    case success(String)
    case error(String)
}

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var state: ViewState = .waiting
    @State private var statusMessage: String = "status"
    @State private var backgroundAnimated: Bool = false
    var body: some View {
        ZStack {
            RadialGradient(colors: [.niceColor, .niceColor], center: .bottomTrailing, startRadius: 50, endRadius: 500)
                .hueRotation(.degrees(backgroundAnimated ? 0 : 20))
                .animation(.easeInOut(duration: 2)
                        .repeatForever(autoreverses: true), value: backgroundAnimated)
                .ignoresSafeArea()
            VStack {
                Text("Login")
                    .font(.title)
                    .bold()
                TextField("Username", text: $username, prompt: Text("Username"))
                    .inputFieldStyle
                SecureField("Password", text: $password, prompt: Text("Password"))
                    .inputFieldStyle
                Button {
                    logIn()
                }label: {
                    Text("Login")
                }
                .buttonStyle(CustomButtonStyle())
                
                switch state {
                case . waiting:
                    Text("")
                case .loading:
                    ProgressView("Loading...")
                case .success(let message):
                    Text(message).foregroundColor(.white)
                case .error(let errorMessage):
                    Text(errorMessage).foregroundColor(.red)
                }
            }
            .padding(.horizontal,50)
            .onAppear {
                backgroundAnimated.toggle()
            }
        }
    }
    
    func logIn() {
        state = .loading
        
        Task {
            try? await Task.sleep(for: .seconds(1))
            
            let logInSuccessful =
                username == "Daniel" &&
                password == "1234"
            
            if logInSuccessful {
                state = .success("Login Successful")
            } else {
                state = .error("Check Username or Password and try again")
            }
        }
    }
}



#Preview {
    ContentView()
}
