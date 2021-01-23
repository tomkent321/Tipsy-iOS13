//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var tipperNum = 2
    var billAmount = 0.0
    var result = 0.0
   
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsAnswer = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsAnswer / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%0.0f",sender.value)
        tipperNum = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
    
        let bill = billTextField.text!
        
        if bill != "" {
            billAmount = Double(bill)!
            result = billAmount * (1 + tip) / Double(tipperNum)
            print("result is: \(result)")
            
            performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = String(format: "%0.2f", result)
            print("result is: \(result)")
            destinationVC.settingsInfo = String("Split between \(tipperNum) people, with \(tip * 100)% tip")
            
        }
    }
    
    
    
}

