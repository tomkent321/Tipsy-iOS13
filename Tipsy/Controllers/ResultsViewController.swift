//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Thomas Hurd on 1/22/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var totalBill: String?
    var settingsInfo: String?
    var billAmt: String?
    var tipAmt: String?
    var allAmt: String?
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var ttlBillAmtLabel: UILabel!
    @IBOutlet weak var ttlTipAmtLabel: UILabel!
    @IBOutlet weak var ttlAllAmtLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalBill
        settingsLabel.text = settingsInfo
        ttlBillAmtLabel.text = billAmt
        ttlTipAmtLabel.text = tipAmt
        ttlAllAmtLabel.text = allAmt
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
