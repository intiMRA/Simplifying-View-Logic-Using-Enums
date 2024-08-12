//
//  ContentView.swift
//  Implicit Viewes With Enums
//
//  Created by ialbuquerque on 12/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = ContentViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    viewModel.didTapButtonOne(with: .red)
                } label: {
                    rectangle
                        .foregroundStyle(.red)
                }
                
                Button {
                    viewModel.didTapButtonOne(with: .yellow)
                } label: {
                    rectangle
                        .foregroundStyle(.yellow)
                }
                
                Button {
                    viewModel.didTapButtonOne(with: .purple)
                } label: {
                    rectangle
                        .foregroundStyle(.purple)
                }
                
                Button {
                    viewModel.didTapButtonOne(with: nil)
                } label: {
                    rectangle
                        .foregroundStyle(.gray.opacity(0.5))
                        .overlay {
                            Text("None")
                                .bold()
                        }
                }
            }
            
            HStack {
                Button {
                    viewModel.didTapButtonTwo(with: .blue)
                } label: {
                    rectangle
                        .foregroundStyle(.blue)
                }
                
                Button {
                    viewModel.didTapButtonTwo(with: .green)
                } label: {
                    rectangle
                        .foregroundStyle(.green)
                }
                
                Button {
                    viewModel.didTapButtonTwo(with: .cyan)
                } label: {
                    rectangle
                        .foregroundStyle(.cyan)
                }
                
                Button {
                    viewModel.didTapButtonTwo(with: nil)
                } label: {
                    rectangle
                        .foregroundStyle(.gray.opacity(0.5))
                        .overlay {
                            Text("None")
                                .bold()
                        }
                }
            }
            
            Toggle("should mix", isOn: viewModel.mixedBinging())
            
            switch viewModel.viewState {
            case .showBothColors(let color1, let color2):
                HStack {
                    VStack {
                        Text("color1")
                        rectangle
                            .foregroundStyle(color1)
                    }
                    
                    VStack {
                        Text("color2")
                        rectangle
                            .foregroundStyle(color2)
                    }
                }
            case .showMixedColors(let color1, let color2):
                VStack {
                    Text("mix")
                    rectangle
                        .foregroundStyle(color1.mix(with: color2, by: 0.5))
                }
            case .showColor(let color, let title):
                VStack {
                    Text(title)
                    rectangle
                        .foregroundStyle(color)
                }
            case .emptyState:
                Text("Please select your colors")
            }
        }
        .padding()
        .animation(.default, value: viewModel.viewState)
    }
    
    var rectangle: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(width: 80, height: 80)
    }
}

#Preview {
    ContentView()
}

extension Color {
    func mix(with color: Color, by percentage: Double) -> Color {
        let clampedPercentage = min(max(percentage, 0), 1)
        
        let components1 = UIColor(self).cgColor.components!
        let components2 = UIColor(color).cgColor.components!
        
        let red = (1.0 - clampedPercentage) * components1[0] + clampedPercentage * components2[0]
        let green = (1.0 - clampedPercentage) * components1[1] + clampedPercentage * components2[1]
        let blue = (1.0 - clampedPercentage) * components1[2] + clampedPercentage * components2[2]
        let alpha = (1.0 - clampedPercentage) * components1[3] + clampedPercentage * components2[3]
        
        return Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}
