//
//  ContentView.swift
//  AdvancedLayoutLab
//
//  Created by Daniel Umpierrez on 5/14/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Section("Hats") {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.flexible())]) {
                            ForEach(hats) { hat in
                                ClothingCard(clothingItem: hat)
                            }
                            
                        }
                    }
                }
                
                Section("Shirts") {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [
                            GridItem(.fixed(125), spacing: 12),
                            GridItem(.fixed(125), spacing: 12)
                        ]) {
                            ForEach(shirts) { shirt in
                                ClothingCard(clothingItem: shirt)
                            }
                            
                        }
                    }
                }
                
                Section("Pants") {
//                    LazyVGrid(columns: [
                    LazyHGrid(rows: [
                        GridItem(.adaptive(minimum: 125), spacing: 12)
                    ]) {
                        ForEach(pants) { pant in
                            ClothingCard(clothingItem: pant)
                            
                        }
                    }
                    .frame(height: 400)
                }
            }
            
        }
        .padding()
    }
    struct ClothingCard: View {
        let clothingItem: Clothing
        var body: some View {
            VStack {
                Text(clothingItem.name)
                    .font(.headline)
                Spacer()
                Text(clothingItem.size)
                Spacer()
                Text("$\(clothingItem.price.formatted())")
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 125)
            .background(Color(hue: 0.4, saturation: 0.3, brightness: 1))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
        
    }
}

#Preview {
    ContentView()
}
