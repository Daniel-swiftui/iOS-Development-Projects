//
//  Calculator.swift
//  Calculator Project
//
//  Created by Jane Madsen on 9/29/25.
//

import SwiftUI

@Observable
class Calculator {
    var displayedString = "0"  // Any time you update this String, it will display on the calculator.
    var firstNumber: Double = 0
    var pendingOperation: CalculatorInput?
    var typingSecondNumber = false
    
    func handleInput(_ input: CalculatorInput) {
        // Each case below represents a single button pressed on the calculator. Add a function for each; the default case covers the number buttons and has been set up for you, but feel free to change this as you see fit.
        
        switch input {
        case .backspace:
            backSpace()
        case .clear:
            clear()
        case .percent:
            percent()
        case .divide:
            divide()
        case .multiply:
            multiply()
        case .subtract:
            subtract()
        case .add:
            add()
        case .invertSign:
            invertSign()
        case .decimal:
            decimal()
        case .equal:
            equal()
        default:
            number(Int(input.rawValue)!)
        }
    }
    
    func format(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        } else {
            return String(value)
        }
    }
    
    func backSpace() {
        if displayedString.count <= 1 {
            displayedString = "0"
        } else {
            displayedString.removeLast()
        }
    }
    
    func clear(){
        displayedString = "0"
        firstNumber = 0
        pendingOperation = nil
        typingSecondNumber = false
    }
    
    func percent() {
        guard let value = Double(displayedString) else { return }
        let result = value / 100
        displayedString = format(result)
    }
    
    func divide() {
        operatorPressed(.divide)
    }
    
    func multiply() {
        operatorPressed(.multiply)
    }
    
    func subtract() {
        operatorPressed(.subtract)
    }
    
    func add() {
        operatorPressed(.add)
    }
    
    func invertSign() {
        guard let value = Double(displayedString) else { return }
        
        let inverted = value * -1
        displayedString = format(inverted)
    }
    
    func decimal() {
        if typingSecondNumber {
            displayedString = "0."
            typingSecondNumber = false
            return
        }
        
        if displayedString.contains(".") {
            return
        }
        
        displayedString.append(".")
    }
    func equal() {
        guard let value = Double(displayedString) else { return }

        guard let result = applyPendingOperation(value) else {
            displayedString = "Error"
            firstNumber = 0
            pendingOperation = nil
            typingSecondNumber = true
            return
        }

        displayedString = format(result)
        firstNumber = result
        pendingOperation = nil
        typingSecondNumber = true
    }
    
    func number(_ number: Int) {
        if typingSecondNumber {
            displayedString = "\(number)"
            typingSecondNumber = false
        } else if displayedString == "0" {
            displayedString = "\(number)"
        } else {
            displayedString.append("\(number)")
        }
    }
    
    func applyPendingOperation(_ secondNumber: Double) -> Double? {
        guard let operation = pendingOperation else {
            return secondNumber
        }

        switch operation {
        case .add:
            return firstNumber + secondNumber
        case .subtract:
            return firstNumber - secondNumber
        case .multiply:
            return firstNumber * secondNumber
        case .divide:
            guard secondNumber != 0 else { return nil }
            return firstNumber / secondNumber
        default:
            return secondNumber
        }
    }
    
    func operatorPressed(_ operation: CalculatorInput) {
        guard let value = Double(displayedString) else { return }
        
        if pendingOperation == nil {
            firstNumber = value
        } else {
            guard let result = applyPendingOperation(value) else {
                displayedString = "Error"
                firstNumber = 0
                pendingOperation = nil
                typingSecondNumber = true
                return
            }
            firstNumber = result
            displayedString = format(result)
        }

        pendingOperation = operation
        typingSecondNumber = true
    }
    
}


#Preview {
    ContentView()
}
