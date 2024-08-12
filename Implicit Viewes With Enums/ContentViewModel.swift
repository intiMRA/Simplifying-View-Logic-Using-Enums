//
//  ContentViewModel.swift
//  Implicit Viewes With Enums
//
//  Created by ialbuquerque on 12/08/2024.
//

import Foundation
import SwiftUI

struct ColorsModel {
    var mix: Bool
    var color1: Color?
    var color2: Color?
}

enum ViewStates: Equatable {
    case showBothColors(color1: Color, color2: Color)
    case showMixedColors(color1: Color, color2: Color)
    case showColor(color: Color, title: String)
    case emptyState
}

@Observable
class ContentViewModel {
    private var colorsModel = ColorsModel(mix: false, color1: nil, color2: nil)
    
    var viewState: ViewStates = .emptyState
    
    func updateState() {
        if let color1 = colorsModel.color1, let color2 = colorsModel.color2 {
            if colorsModel.mix {
                viewState = .showMixedColors(color1: color1, color2: color2)
            }
            else {
                viewState = .showBothColors(color1: color1, color2: color2)
            }
        }
        else if let color1 = colorsModel.color1 {
            viewState = .showColor(color: color1, title: "Color 1")
        }
        else if let color2 = colorsModel.color2 {
            viewState = .showColor(color: color2, title: "Color 2")
        }
        else {
            viewState = .emptyState
        }
    }
    
    func didTapButtonOne(with color: Color?) {
        colorsModel.color1 = color
        updateState()
    }
    
    func didTapButtonTwo(with color: Color?) {
        colorsModel.color2 = color
        updateState()
    }
    
    func mixedBinging() -> Binding<Bool> {
        .init {
            self.colorsModel.mix
        } set: { newValue in
            if newValue != self.colorsModel.mix {
                self.colorsModel.mix = newValue
                self.updateState()
            }
        }

    }
}
