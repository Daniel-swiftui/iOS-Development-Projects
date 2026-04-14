//
//  CarDetails.swift
//  ListLab
//
//  Created by Daniel Umpierrez on 3/2/26.
//

import SwiftUI

struct CarDetails: View {
    @State private var make = ""
    @State private var model = ""
    @State private var year = ""
    let textField = ["make", "model", "year"]
    var body: some View {
        Form {
            Section {
                TextField("", text: $make, prompt: Text("Make").foregroundStyle(.white))
                    .listRowTheme()
                
            } header: {
                Text("Make")
                    .headerTheme()
            }
            Section {
                TextField("", text: $model,prompt: Text("Model").foregroundStyle(.white))
                    .listRowTheme()
            } header: {
                Text("Model")
                    .headerTheme()
            }
            Section {
                TextField("", text: $year,prompt: Text("Year").foregroundStyle(.white))
                    .listRowTheme()
            } header: {
                Text("Year")
                    .headerTheme()
            }
            
        }
        .listStyle(.automatic)
        .scrollContentBackground(.hidden)
        .background(Color(hue: 0.4, saturation: 0.4, brightness: 0.3, opacity: 1))
        .accentColor(Color(hue: 0.3, saturation: 0.4, brightness: 1, opacity: 1))
        
    }
}


#Preview {
    CarDetails()
}
