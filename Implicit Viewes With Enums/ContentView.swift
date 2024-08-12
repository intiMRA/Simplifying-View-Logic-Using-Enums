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
            }
            
            Toggle("should mix", isOn: $viewModel.colorsModel.mix)
            
            if viewModel.colorsModel.shouldShowColorOne, viewModel.colorsModel.shouldShowColorTwo {
                if viewModel.colorsModel.mix {
                    Text("mix")
                    rectangle
                        .foregroundStyle(viewModel.colorsModel.color1.mix(with: viewModel.colorsModel.color2, by: 0.5))
                }
                else {
                    HStack {
                        VStack {
                            Text("color1")
                            rectangle
                                .foregroundStyle(viewModel.colorsModel.color1)
                        }
                        
                        VStack {
                            Text("color2")
                            rectangle
                                .foregroundStyle(viewModel.colorsModel.color2)
                        }
                    }
                }
            }
            else if viewModel.colorsModel.shouldShowColorOne {
                VStack {
                    Text("color1")
                    rectangle
                        .foregroundStyle(viewModel.colorsModel.color1)
                }
            }
            else if viewModel.colorsModel.shouldShowColorTwo {
                VStack {
                    Text("color2")
                    rectangle
                        .foregroundStyle(viewModel.colorsModel.color1)
                }
            }
        }
        .padding()
    }
    
    var rectangle: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(width: 100, height: 100)
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
