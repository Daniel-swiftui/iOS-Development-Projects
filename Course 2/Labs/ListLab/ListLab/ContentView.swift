//
//  ContentView.swift
//  ListLab
//
//  Created by Daniel Umpierrez on 3/2/26.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(hue: 0.4, saturation: 0.4, brightness: 0.8, alpha: 1)]
    }
    
    var body: some View {
        CarsListView()
    }
}
struct CarsListView: View {
    let cars: [Cars] = [
        Cars(make: "Toyota", model: "Corrola", year: 2026),Cars(make: "Honda", model: "Civc", year: 2011),Cars(make: "Chevy", model: "Silverado", year: 1993)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(cars, id: \.make) { (car: Cars) in
                        CarsCellView(car: car)
                            .listRowTheme()
                            .swipeActions(edge: .trailing) {
                                NavigationLink(destination: CarDetails()) {
                                    Button(action:{}) {
                                        Image(systemName: "pencil")
                                    }
                                }
                                .tint(Color(hue: 0.3, saturation: 0.5, brightness: 0.9, opacity: 0.8))
                            }
                            .swipeActions(edge: .leading) {
                                
                                Button(action:{}) {
                                    Image(systemName: "trash")
                                }
                                
                                .tint(Color(hue: 1, saturation: 1, brightness: 0.8, opacity: 0.8))
                            }
                    }
                }header: {
                    Text("Cars")
                        .headerTheme()
                }
            }
            //This is the background for the app
            .listStyle(.automatic)
            .scrollContentBackground(.hidden)
            .background(Color(hue: 0.4, saturation: 0.4, brightness: 0.3, opacity: 1))
            .navigationTitle("Garage")
        }
        
    }
    
}
struct CarsCellView: View {
    let car: Cars
    var body: some View {
        
        HStack {
            VStack (alignment: .leading) {
                Text(car.make)
                    .bold()
                Text(car.model)
                    .font(.subheadline)
            }
            Spacer()
            Text(String(car.year))
        }
    }
}
struct Cars {
    let make: String
    let model: String
    let year: Int
    
}

//This Controls the header Color
struct HeaderTheme: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.heavy)
            .foregroundStyle(Color(hue: 0.4, saturation: 0.3, brightness: 0.8, opacity: 1))
    }
}
extension View {
    func headerTheme() -> some View {
        modifier(HeaderTheme())
    }
}
//This controls the Color of the list rows
struct ListRowTheme: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(Color(hue: 0.1, saturation: 0.5, brightness: 0.9, opacity: 0.5))
            .foregroundStyle(.white)
            .listRowSeparatorTint(.white)
    }
}
extension View {
    func listRowTheme() -> some View {
        modifier(ListRowTheme())
    }
}

#Preview {
    ContentView()
}


