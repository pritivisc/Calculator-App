//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Pritivi S Chhabria on 8/17/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (num1: Double, calcFunc: String)?
    
    mutating func calculate(symbol: String) -> Double? {
        if let safeNumber = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return safeNumber * -1
            case "%":
                return safeNumber / 100.0
            case "=":
                return performCalc(num2: safeNumber)
            default:
                self.intermediateCalculation = (num1: safeNumber, calcFunc: symbol)
            }
        }
        return nil
    }
    
    func performCalc(num2: Double) -> Double? {
        if let num1 = intermediateCalculation?.num1, let operation = intermediateCalculation?.calcFunc {
            switch operation {
            case "+":
                return num1 + num2
            case "-":
                return num1 - num2
            case "×":
                return num1 * num2
            case "÷":
                return num1 / num2
            default:
                fatalError("Invalid operation")
            }
        }
        return nil
    }
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
}
