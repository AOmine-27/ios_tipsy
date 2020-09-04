//
//  bill.swift
//  Tipsy
//
//  Created by Andre Omine on 28/05/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct Bill {
    let totalValue : Double
    var individualValue : Double
    let split : Int
    let tip : Double
    
    init(totalValue: Double, split: Int, tip: Double, individualValue: Double) {
        self.totalValue = totalValue
        self.split = split
        self.tip = tip
        self.individualValue = individualValue
    }
}
