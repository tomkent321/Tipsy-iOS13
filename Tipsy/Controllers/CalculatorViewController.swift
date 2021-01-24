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
    @IBOutlet weak var fifteenPctButton: UIButton!
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
        fifteenPctButton.isSelected = false
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
        
        if bill != "" && Double(bill) != nil {
            billAmount = Double(bill)!
            result = billAmount * (1 + tip) / Double(tipperNum)
       
            performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
     // This is to tranform the raw numbers into formatted text numbers strings that have the correct number of
     // leading spaces to align on the results screen and to have comma separators and 2 decimal points using
     // the numberFormatter method in the Foundation class
            
     // get the count of the numbers in each variable

            let billCt = String(Int(billAmount)).count
            let tipCt = String(Int(billAmount * tip)).count
            let totalCt = String(Int(billAmount + (billAmount * tip))).count
            
     // this array sets up the number of spaces to place in front of the number to align them with each other
//            let spacer = [
//            "",
//            " ",
//            "  ",
//            "   ",
//            "    "
//            ]
       
            let spacer = [
                "",
                "",
                "",
                "",
                "",
                "",
                
            ]
            
            
            
       // initialize the numberFormatter method, this will limit decimals to only 2 and will insert commmas
       // as thousands separators
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.minimumFractionDigits = 2
            numberFormatter.maximumFractionDigits = 2
    
      // format the variables with the number formatter
            let biller = numberFormatter.string(from: NSNumber(value:billAmount))
            let tipper =  numberFormatter.string(from: NSNumber(value:billAmount * tip))
            let totaller = numberFormatter.string(from: NSNumber(value: (billAmount * tip) + billAmount))
            
      // take the formatted number and add the spaces in front of each to align them correctly
            let billSpaced = spacer[totalCt - billCt] + biller!
            let tipSpaced =  spacer[totalCt - tipCt] + tipper!


            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = numberFormatter.string(from: NSNumber(value:result))
            
            if tipperNum > 1 {
                destinationVC.settingsInfo = String("Tip split between \(tipperNum) people, with \(tip * 100)% tip")}
            else {
                destinationVC.settingsInfo = String("Your tip at \(tip * 100)%")
            }
            
            destinationVC.billAmt = billSpaced
            destinationVC.tipAmt = tipSpaced
            destinationVC.allAmt = totaller
            
        }
    }
    
    
    
}

