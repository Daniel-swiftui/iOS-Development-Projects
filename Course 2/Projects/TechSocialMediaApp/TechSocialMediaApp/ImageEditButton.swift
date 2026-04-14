//
//  ImageEditButton.swift
//  TechSocialMediaApp
//
//  Created by Daniel Umpierrez on 4/2/26.
//

import SwiftUI

struct ImageEditButton: View  {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .frame(width: 40)
                    .foregroundStyle(.white)
                Circle()
                    .frame(width: 35)
                    .foregroundStyle(.gray)
                
                Image(systemName: "camera.fill")
                    .imageScale(.small)
                    .foregroundStyle(.black)
                    .font(.system(size: 18))
            }
        }
    }
}
