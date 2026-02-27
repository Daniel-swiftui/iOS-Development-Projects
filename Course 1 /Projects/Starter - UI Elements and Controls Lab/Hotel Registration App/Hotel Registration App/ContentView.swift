//
//  ContentView.swift
//  Hotel Registration App
//
//  Created by Jane Madsen on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            HotelRegistrationScreen()
        }
    }
}

struct HotelRegistrationScreen: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var doorCode: String = ""
    @State private var numberOfGuests: String = "1"
    @State private var lengthOfStay: Int = 1
    @State private var nonSmoking: Bool = true
    @State private var registrationFeedback: Double = 1
    @State private var submitted: Bool = false
    
    let guestPicker = ["1","2","3","4","5","6","7","8","9","10"]
    
    var body: some View {
            VStack {
                HStack (alignment: .center){
                    Image("mountainlandLogo")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(10)
                        Text("Mountainland Inn")
                        .foregroundStyle(Color.background)
                        .font(.custom("Rockwell", size: 25))
                        .bold()
                        .frame(maxWidth: .infinity,maxHeight: 75)
                        .padding(15)
                        .background(.highlight)
                        .cornerRadius(15)
                }
                .padding()
                VStack(alignment: .leading){
                    TextField("FirstName", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                        .font(.custom("Verdana", size: 18))
                    TextField("LastName", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                        .font(.custom("Verdana", size: 18))
                    SecureField("DoorCode", text: $doorCode)
                        .textFieldStyle(.roundedBorder)
                        .font(.custom("Verdana", size: 18))
                    HStack {
                        Text("Guests:")
                            .font(.custom("Verdana", size: 18))
                        Picker("Number of Guests", selection: $numberOfGuests) {
                            ForEach(guestPicker, id: \.self) { number in
                                Text(number)
                            }
                            .font(.custom("Verdana", size: 18))
                        }
                    }
                    Stepper("Length of Stay: \(lengthOfStay)", value: $lengthOfStay)
                        .font(.custom("Verdana", size: 18))
                    Toggle("NonSmoking", isOn: $nonSmoking)
                        .font(.custom("Verdana", size: 18))
                    
                    Button(action: submit) {
                        Text("Submit")
                            .font(.custom("Verdana", size: 18))
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.highlight)
                    if submitted == true {
                        VStack {
                            Text("Thank you for booking with us! How would you rate your experience?")
                                .padding()
                                .foregroundStyle(Color.background)
                                .font(.custom("Verdana", size: 20))
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundStyle(.highlight)
                                       
                                )
                            Slider(value: $registrationFeedback, in: 0...5, step: 1)
                                
                            HStack(alignment: .center) {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(Color.highlight)
                                Text("\(Int(registrationFeedback)) ")
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                Spacer()
        }
    }
    func submit() {
        submitted = true
    }
}

#Preview {
    ContentView()
    
}
