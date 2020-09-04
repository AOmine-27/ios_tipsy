//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //declara uma struct billMain
    var mainBill = billMain()
    
    //Atrela os buttons da interface
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPct: UIButton!
    @IBOutlet weak var tenPct: UIButton!
    @IBOutlet weak var twentyPct: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    //Zera os valores
    var tipValue = 0.0
    var splitNumber = 2
    var totalBill = 0.0
    var individualBill = 0.0
    
    
    //observa o clique da porcentagem
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPct.isSelected = false
        tenPct.isSelected = false
        twentyPct.isSelected = false
        sender.isSelected = true
        
        if zeroPct.isSelected == true {
            tipValue = 0
        } else if tenPct.isSelected == true {
            tipValue = 0.1
        } else {
            tipValue = 0.2
        }

    }
    
    //Atua quando o stepper tem o valor alterado
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNumber = Int(sender.value)
        
    }
    
    
    //Atua quando o botão de calcular é pressionado
    @IBAction func calculatedPressed(_ sender: UIButton) {
        let billText = billTextField.text!.replacingOccurrences(of: ",", with: ".")
        totalBill = Double(billText) ?? 0.0
        mainBill.calculateIndValue(totalBill, splitNumber, tipValue)
        print(mainBill.getIndividualValue())
        self.performSegue(withIdentifier: "goToSegue", sender: self)
    }
    
    
    //func prepare é executado no performSegue automaticamente
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier!)
        if (segue.identifier == "goToSegue") {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.individualValue = mainBill.getIndividualValue()
            destinationVC.settingsText = mainBill.getSettingText()
        }
    }

    
}

