//
//  ContentView.swift
//  MyFamilyProject
//
//  Created by Daniel Umpierrez on 3/4/26.
//

import SwiftUI

struct DashBoardView: View {
    @State private var familyMembers = FamilyMember.memberDetails
    var body: some View {
        NavigationStack {
            List {
                Section("Family Members") {
                    ForEach($familyMembers){ member in
                        FamilyMemberRowView(familyMember: member)
                    }
                }
            }
            .navigationTitle("DashBoard")
        }
    }
}
#Preview {
    DashBoardView()
}

