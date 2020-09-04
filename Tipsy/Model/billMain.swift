//
//  billMain.swift
//  Tipsy
//
//  Created by Andre Omine on 28/05/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct billMain{
    var bill : Bill?
    
    mutating func calculateIndValue(_ totVal: Double, _ splitNum: Int, _ tipVal: Double){
        let indVal = Double(totVal * Double(1+tipVal)) / Double(splitNum)
        
        bill = Bill(totalValue: totVal, split: splitNum, tip:tipVal, individualValue: indVal)
    }
    
    func getTotalValue()->Double {
        return bill?.totalValue ?? 0.0
    }
    
    func getIndividualValue()->Double {
        return bill?.individualValue ?? 0.0
    }
    
    func getSplit()->Int {
        return bill?.split ?? 0
    }
    
    func getTip()->String {
        let tip = bill?.tip
        
        if tip == 0.1 {
            return "10%"
        } else if tip == 0.2 {
            return "20%"
        } else {
            return "0%"
        }
    }
    
    func getSettingText()->String {
        let setText = "Split between \(bill?.split ?? 0) people, with \(self.getTip()) tip."
        return setText
    }

}
