//
//  ViewController.swift
//  ErrorType
//
//  Created by Henrique Valcanaia on 2/11/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import UIKit

// MARK: - Error with enum
enum DivisionErrorEnum: Error {
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
            throw DivisionErrorEnum.dividendIsZero(code: 1)
        }
        
        guard y != 0 else{
            throw DivisionErrorEnum.divisorIsZero(code: 2)
        }
        
        return x/y
    }
    
    // MARK: IBActions
    @IBAction func calculate(_ sender: UIButton) {
        do {
            if let x = Float(dividendTextField.text!), let y = Float(divisorTextField.text!) {
                let result = try divide(x, y)
                resultLabel.text = String(result)
            } else {
                resultLabel.text = "NaN"
            }
        } catch DivisionErrorEnum.dividendIsZero(let code) {
            print("Your message when the DIVIDEND is zero. \nDetails: Execution failed with code: \(code).")
        } catch DivisionErrorEnum.divisorIsZero(let code) {
            print("Your custom message when the DIVISOR is zero. \nDetails: Execution failed with code: \(code).")
        } catch let error { // error conforms with ErrorType
            print("Another error occurred. SOS!\n\(error)")
        }
    }
    
}

