//
//  SpaceshipScreen.swift
//  State Spaceship (aka Stateship)
//
//  Created by Jane Madsen on 9/29/25.
//

import SwiftUI

@Observable class ShipComputer {
    var availablePower = 10
    var heading = ""
}

struct SpaceshipScreen: View {
    @State var shipComputer = ShipComputer()
    var body: some View {
        Form {
            Section("Helm Station") {
                HelmStation()
            }
            
            Section("Weapons Station") {
                WeaponsStation()
            }
            
            Section("Shield Station") {
                ShieldStation()
            }
            
            Section("Engine Station") {
                EngineStation()
            }
            
            Text("Available Power: \(shipComputer.availablePower)")
            
        }
        .padding()
        .environment(shipComputer)
    }
}

struct HelmStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State private var inChair: Bool = false

    var body: some View {
        HStack {
            CrewChair(crewMember: .dog, inChair: $inChair)
            
            @Bindable var bindableComputer = shipComputer
            TextField("Heading", text: $bindableComputer.heading)
                .disabled(!inChair)
        }
    }
}

struct WeaponsStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State private var isOn: Bool = false
    @State private var weaponPower = 0
    @State private var inChair: Bool = false

    var body: some View {
        HStack {
            CrewChair(crewMember: .cat, inChair: $inChair)
            
            VStack {
                Toggle("Weapons Power: \(weaponPower)", isOn: $isOn)
                //            .onChange(of: isOn) {
                //                // Add logic to remove/add 3 power to the system when enabled/disabled
                //            }
                    .onChange(of: isOn) {
                        if isOn {
                            shipComputer.availablePower -= 3
                            weaponPower = 3
                        } else {
                            shipComputer.availablePower += 3
                            weaponPower = 0
                        }
                        if shipComputer.availablePower < 0 {
                            isOn = false
                        }
                    }
                
                
                Button("Fire!") {
                    // Add logic to only allow firing if power is available
                    if weaponPower > 0 {
                        weaponPower -= 1
                    } else {
                        isOn = false
                    }
                    print("PEW!")
                }
                .disabled(!inChair)
            }
        }
    }
}

struct ShieldStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State private var shieldPower = 0
    @State private var inChair: Bool = false

    var body: some View {
        HStack {
            CrewChair(crewMember: .lizard, inChair: $inChair)
            
            Stepper("Shield Power: \(shieldPower)", value: $shieldPower, in: 0...10)
                .onChange(of: shieldPower) { oldValue, newValue in
                    let difference = newValue - oldValue
                    
                    shipComputer.availablePower -= difference
                    
                    if shipComputer.availablePower < 0 {
                        shieldPower = oldValue
                    }
                }
                .disabled(!inChair)
        }
    }
}

struct EngineStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State private var enginePower = 0
    @State private var inChair: Bool = false
    var body: some View {
        HStack {
            CrewChair(crewMember: .hare, inChair: $inChair)
            Stepper("Engine Power: \(enginePower)", value: $enginePower, in: 0...10)
                .onChange(of: enginePower) { oldValue, newValue in
                    let difference = newValue - oldValue
                    
                    shipComputer.availablePower -= difference
                    
                    if shipComputer.availablePower < 0 {
                        enginePower = oldValue
                    }
                }
                .disabled(!inChair)
        }
    }
}

struct CrewChair: View {
    var crewMember: Crew
    @Binding var inChair: Bool
    
    var body: some View {
        Button {
            inChair.toggle()
        } label: {
            if inChair {
                crewMember.icon
            } else {
                Image(systemName: "person.slash")
            }
        }
        .buttonStyle(BorderedButtonStyle())
        .padding(5)
        .background {
            Circle()
                .foregroundStyle(.gray)
        }
    }
}

enum Crew: String {
    case dog
    case cat
    case lizard
    case hare
    
    var icon: Image {
        switch self {
        case .dog:
            Image(systemName: "dog")
        case .cat:
            Image(systemName: "cat")
        case .lizard:
            Image(systemName: "lizard")
        case .hare:
            Image(systemName: "hare")
        }
    }
}

#Preview {
    SpaceshipScreen()
}
