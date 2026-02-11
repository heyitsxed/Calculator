//
//  Calculator.swift
//  Calculator
//
//  Created by Cedrick on 2/11/26.
//

import SwiftUI

struct Calculator: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    private func buttonColor(buttons: String) -> Color {
        return ["÷", "×", "-", "+", "="].contains(buttons) ? .orange : .gray
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            HStack {
                Spacer()
                
                Text(viewModel.input.isEmpty ? viewModel.result : viewModel.input)
                    .font(.largeTitle)
                    .padding()
            }
            
            ForEach(viewModel.buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            viewModel.tappedButton(button)
                        }, label: {
                            Text(button)
                                .padding()
                                .frame(width: 90, height: 90)
                                .background(buttonColor(buttons: button))
                                .cornerRadius(50)
                                .foregroundColor(.white)
                                .font(.title)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    Calculator()
}
