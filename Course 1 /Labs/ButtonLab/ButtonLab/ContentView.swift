//
//  ContentView.swift
//  ButtonLab
//
//  Created by Daniel Umpierrez on 2/23/26.
//

import SwiftUI

struct ContentView: View {
@State var count = 0
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Count:\(count)")
                .font(.custom("futura", size: 30))
                .bold()
            
            Button(action: tap1){
                Text("Tap me 1")
                    .frame(maxWidth: .infinity)
            }
                .buttonStyle(.bordered)
                .tint(.blue)
                .foregroundStyle(.black)
            Button(action: tap2){
                Text("Tap me 2")
                    .frame(maxWidth: .infinity)
            }
                .buttonStyle(.bordered)
                .foregroundStyle(.red)
            Button(action: tap3){
                Text("Tap me 3")
                    .frame(maxWidth: .infinity)
            }
                .buttonStyle(.borderedProminent)
            Button(action: tap4){
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 20)
            }
                .buttonStyle(.glassProminent)
                .tint(.pink)
            Button(action: tap5){
                Text("Tap me 5")
                    .frame(maxWidth: .infinity)
            }
                .buttonStyle(.glassProminent)
                .tint(.purple)
            Button(action: tap6){
                Text("Tap me 6")
                    .frame(maxWidth: .infinity)
            }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
            Button(action: tap7){
                Text("Tap me 7")
                    .frame(maxWidth: .infinity)
            }
                .buttonStyle(.borderedProminent)
                .tint(.green)
            Button(action: tap8){
                Text("Tap me 8")
                    .frame(maxWidth: .infinity)
            }
                .buttonStyle(.borderedProminent)
                .tint(.cyan)
            Button(action: tap9){
                Text("Tap me 9")
                    .frame(maxWidth: .infinity)
            }
                .buttonStyle(.borderedProminent)
                .tint(.yellow)
            Button(action: tap10) {
                Text("Tap me 10")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(GraidentButtonStyle())
            .tint(.mint)
                
        }
        .padding()
    }
    func tap1() { count += 1 }
    func tap2() { count -= 1 }
    func tap3() { count = 0 }
}

struct GraidentButtonStyle: ButtonStyle {
    
    private var notPressedStartColor = Color.blue
    private var pressedStartColor = Color.red
    private var notPressedEndColor = Color.yellow
    private var pressedEndColor = Color.orange
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(
                LinearGradient(colors: [(configuration.isPressed ? pressedStartColor : notPressedStartColor), .green, (configuration.isPressed ? pressedEndColor : notPressedEndColor)], startPoint: .leading, endPoint: .trailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

func tap4() {}
func tap5() {}
func tap6() {}
func tap7() {}
func tap8() {}
func tap9() {}
func tap10() {}

#Preview {
    ContentView()
}
