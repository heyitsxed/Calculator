//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Cedrick on 2/11/26.
//

import Combine
import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var input: String = ""
    @Published var result: String = "0"
    
    let buttons: [[String]] = [
        ["7", "8", "9", "÷"],
        ["4", "5", "6", "×"],
        ["1", "2", "3", "-"],
        ["0", ".", "=", "+"]
    ]
    
    func calculatedResult() {
        if input.isEmpty,
           let current = Int(result) {
            result = String(current * 2)
            return
        }
        
        let expression = input.replacingOccurrences(of: "×", with: "*")
            .replacingOccurrences(of: "÷", with: "/")
        let exp: NSExpression = NSExpression(format: expression)
        
        if let value = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            result = String(describing: value)
            input = ""
        }
    }
    
    func tappedButton(_ button: String) {
        switch button {
        case "0"..."9", ".":
            input += button
            
        case "+", "-", "×", "÷":
            guard !input.isEmpty && !input.hasSuffix(" ") else { return }
            input += " \(button) "
            
        case "=":
            calculatedResult()
        default:
            break
        }
    }
    
    func clearResult() {
        input = ""
        result = "0"
    }
}
