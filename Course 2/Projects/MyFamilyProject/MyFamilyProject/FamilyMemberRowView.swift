//
//  FamilyMemberRowView.swift
//  MyFamilyProject
//
//  Created by Daniel Umpierrez on 3/4/26.
//

import SwiftUI

struct FamilyMemberRowView: View {
    @Binding var familyMember: FamilyMember
    @State private var showDetails = false
    var body: some View {
        HStack{
            Button {
                familyMember.viewed = true
                showDetails = true
            } label: {
                Circle()
                    .strokeBorder(.blue, lineWidth: 1)
                    .background(Circle().fill(familyMember.viewed ? .green : .clear))
                    .frame(width: 20, height: 20)
            }
            Image(familyMember.profileImage)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            Text(familyMember.name)
                .padding(.leading, 5)
            Spacer()
        }
        .padding()
        .frame(height: 40)
        .sheet(isPresented: $showDetails) {
            DetailsSheet(familyMember: $familyMember)
        }
    }
}

#Preview {
    DashBoardView()
}
