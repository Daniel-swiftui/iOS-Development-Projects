//
//  DetailsView.swift
//  MyFamilyProject
//
//  Created by Daniel Umpierrez on 3/4/26.
//

import SwiftUI

struct DetailsSheet: View {
    @Environment(\.dismiss) var dismiss
    @Binding var familyMember: FamilyMember
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("\(familyMember.name)'s Details")
                .font(.title)
                .bold()
            Image(familyMember.profileImage)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            List {
                Section("Details") {
                    HStack {
                        Text("**Name:**")
                        Text(familyMember.name)
                    }
                    HStack {
                        Text("**Age:**")
                        Text(String(familyMember.age))
                    }
                    HStack {
                        Text("**Favorite Color:**")
                        Text(familyMember.favoriteColor)
                    }
                    HStack {
                        Text("**Favorite Food:**")
                        Text(familyMember.favoriteFood)
                    }
                    HStack {
                        Text("**Relationship:**")
                        Text(familyMember.familyRelation)
                    }
                }
            }
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        .padding(.vertical, 50)
        .padding(.horizontal, 30)
        Spacer()
    }
}
#Preview {
    DashBoardView()
}
