//
//  ViewController.swift
//  ErrorType
//
//  Created by Henrique Valcanaia on 2/11/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import UIKit

// MARK: - Enum implemententing Error protocol
enum DivisionError: Error {
    case dividendIsZero(code: Int)
    case divisorIsZero(code: Int)
}

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var dividendTextField: UITextField!
    @IBOutlet weak var divisorTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Private methods
    private func divide(_ x:Float, _ y: Float) throws -> Float {
        guard x != 0 else {
            throw DivisionError.dividendIsZero(code: 1)
        }
        
        guard y != 0 else{
            throw DivisionError.divisorIsZero(code: 2)
        }
        
        return x/y
    }
    
    // MARK: IBActions
    @IBAction func calculate(_ sender: UIButton) {
        do {
            guard
                let x = Float(dividendTextField.text!),
                let y = Float(divisorTextField.text!) else {
                    resultLabel.text = "X or Y NaN"
                    return
            }
            
            let result = try divide(x, y)
            resultLabel.text = String(result)
            
        } catch DivisionError.dividendIsZero(let code) {
            print("Message when the DIVIDEND is zero.")
            print("Details: Failed with code: \(code).")
            
        } catch DivisionError.divisorIsZero(let code) {
            print("Message when the DIVISOR is zero.")
            print("Details: Failed with code: \(code).")
            
        } catch let error { // error conforms with Error
            print("Another error occurred. SOS!")
            print("Error { _code: \(error._code), domain: \(error._domain) }")
        }
    }
    
}

