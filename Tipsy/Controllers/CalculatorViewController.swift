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
    
    var pctSelected = 0.1
    var tipperNum = 2
    
   
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender.currentTitle == "0%"{
            zeroPctButton.isSelected = true
                pctSelected = 0.0
            } else if sender.currentTitle == "10%"{
                tenPctButton.isSelected = true
                
                pctSelected = 0.1
            } else {
                twentyPctButton.isSelected = true
                zeroPctButton.isSelected = false
                pctSelected = 0.2
            }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%0.0f",sender.value)
        tipperNum = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        print("tip: \(pctSelected)")
        print("tippers: \(tipperNum)")
    }
    
    


}

