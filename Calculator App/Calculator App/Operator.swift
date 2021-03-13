//
//  Operator.swift
//  Calculator App
//
//  Created by Arshmeet Sodhi on 3/4/21.
//

import Foundation

class Operator {
    
    var op: (Double, Double) -> Double
    var isDivision = false
    
    init(_ string: String) {
        
        if string == "+" {
            self.op = (+)
        }
        else if string == "-" {
            self.op = (-)
        }
        else if string == String("\u{00f7}") {
            self.op = (*)
        }
        else {
            self.op = (/)
            self.isDivision = true
        }
    }
    
}
