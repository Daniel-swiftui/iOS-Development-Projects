//
//  ShakeEffect.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/30/26.
//

import SwiftUI

struct ShakeEffect: GeometryEffect {
    var travelDistance: CGFloat = 20
    var shakesPerUnit: CGFloat = 4

    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        let translation = travelDistance * sin(animatableData * .pi * shakesPerUnit)

        return ProjectionTransform(
            CGAffineTransform(translationX: translation, y: 0)
        )
    }
}
