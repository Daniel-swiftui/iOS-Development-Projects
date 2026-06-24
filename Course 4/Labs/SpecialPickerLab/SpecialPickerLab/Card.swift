//
//  Card.swift
//  SpecialPickerLab
//
//  Created by Daniel Umpierrez on 5/18/26.
//

import Foundation
import SwiftUI
import PhotosUI

struct Card {
    var description: String = ""
    var date: Date
    var backgroundColor: Color
    var photoItem: PhotosPickerItem?
    var photoImage: UIImage?
}
