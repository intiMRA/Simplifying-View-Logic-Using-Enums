//
//  ContentViewModel.swift
//  Implicit Viewes With Enums
//
//  Created by ialbuquerque on 12/08/2024.
//

import Foundation
import SwiftUI

struct ColorsModel {
    var shouldShowColorOne: Bool
    var shouldShowColorTwo: Bool
    var mix: Bool
    
    var color1: Color
    var color2: Color
}

@Observable
class ContentViewModel {
    var colorsModel = ColorsModel(shouldShowColorOne: false, shouldShowColorTwo: false, mix: false, color1: .clear, color2: .clear)
    
    func didTapButtonOne(with color: Color?) {
        if let color {
            colorsModel.color1 = color
            colorsModel.shouldShowColorOne = true
        }
        else {
            colorsModel.color1 = .clear
            colorsModel.shouldShowColorOne = false
        }
    }
    
    func didTapButtonTwo(with color: Color?) {
        if let color {
            colorsModel.color2 = color
            colorsModel.shouldShowColorTwo = true
        }
        else {
            colorsModel.color2 = .clear
            colorsModel.shouldShowColorTwo = false
        }
    }
}
