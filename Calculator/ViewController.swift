//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var typingFlag: Bool = true
    
    private var displayValue: Double {
        get {
            guard let curVal = Double(displayLabel.text!) else {
                fatalError("Error while converting display label to a Double.")
            }
            return curVal
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calc = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        typingFlag = true
        calc.setNumber(displayValue)
        if let curTitle = sender.currentTitle {
            if let result = calc.calculate(symbol: curTitle) {
                displayValue = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        if let numVal = sender.currentTitle, let labelVal = displayLabel.text {
            if typingFlag {
                displayLabel.text = numVal
                typingFlag = false
            } else {
                if floor(displayValue) != displayValue {
                    return
                }
                displayLabel.text = labelVal + numVal
            }
        }
    
    }

}

