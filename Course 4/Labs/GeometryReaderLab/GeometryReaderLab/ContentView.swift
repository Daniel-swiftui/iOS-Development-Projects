//
//  ContentView.swift
//  GeometryReaderLab
//
//  Created by Daniel Umpierrez on 5/12/26.
//

import SwiftUI

struct Profile {
    var profilePicture: String
    var name: String
    var description: String
}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    let profiles: [Profile] = [
        Profile(profilePicture: "person.circle.fill", name: "Daniel", description: "I am first"),
        Profile(profilePicture: "star.fill", name: "David", description: "I am second"),
        Profile(profilePicture: "heart.fill", name: "Emma", description: "I am third"),
        Profile(profilePicture: "cloud.fill", name: "Amy", description: "I am forth"),
        Profile(profilePicture: "person.circle", name: "Person", description: "I am a person"),
        Profile(profilePicture: "person.circle", name: "Person", description: "I am a person"),
        Profile(profilePicture: "person.circle", name: "Person", description: "I am a person"),
        Profile(profilePicture: "person.circle", name: "Person", description: "I am a person"),
        Profile(profilePicture: "person.circle", name: "Person", description: "I am a person")
    ]
    var columnCount: Int {
        horizontalSizeClass == .compact ? 2 : 4
    }
    
    
    var rowCount: Int {
        Int(ceil(Double(profiles.count) / Double(columnCount)))
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            let spacing: CGFloat = 16
            let horizontalPadding: CGFloat = 16
            
            let totalSpacing =
                spacing * CGFloat(columnCount - 1) +
                horizontalPadding * 2
            
            let cardWidth =
                (geometry.size.width - totalSpacing) / CGFloat(columnCount)
            
            ScrollView {
                
                VStack(alignment: .center, spacing: spacing) {
                    
                    ForEach(0..<rowCount, id: \.self) { row in
                        
                        HStack(alignment: .top, spacing: spacing) {
                            
                            ForEach(0..<columnCount, id: \.self) { column in
                                
                                let index = row * columnCount + column
                                
                                if index < profiles.count {
                                    
                                    ProfileCard(profile: profiles[index])
                                        .frame(width: cardWidth)
                                    
                                } else {
                                    
                                    Spacer()
                                        .frame(width: cardWidth)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical)
            }
        }
    }
}

struct ProfileCard: View {
    
    let profile: Profile
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            Image(systemName: profile.profilePicture)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .foregroundColor(.white)
            
            Text(profile.name)
                .font(.headline)

            
            Text(profile.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 220)
        .background(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .top, endPoint: .bottom).opacity(0.5))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}
struct ProfileCardExpanded: View {
    
    let profile: Profile
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            Image(systemName: profile.profilePicture)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .foregroundColor(.white)
            
            Text(profile.name)
                .font(.headline)

            
            Text(profile.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 220)
        .background(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .top, endPoint: .bottom).opacity(0.5))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}
#Preview {
    ContentView()
}
